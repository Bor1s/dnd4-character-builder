class Rule
  include Mongoid::Document
  attr_accessor :character

  field :todo, type: Hash
  field :name, type: String
  field :one_off, type: Boolean, default: false
  field :stage, type: Integer

  scope :staged, ->(_stage) { where(stage: _stage) }

  def process
    raise NoCharacterProvidedException, "No character instance provided!" unless character
    raise EmptyRuleException, "Rule #{self.inspect} has empty :todo field!" unless todo
    RuleMapper.store(self)
    parse(todo.with_indifferent_access, revert_mode: false)
  end

  def revert
    parse(todo.with_indifferent_access, revert_mode: true)
  end

  private

  def parse(rule_hash, revert_mode: false)
    handle_rule_condition(rule_hash)
    handle_rule_storage(rule_hash, revert_mode: revert_mode)
  end

  def foobar
    raise 'foobar'
  end

  def normalize(str)
    str.gsub(/{([^{}]+)}/) do |meth|
      meth = $1.to_sym
      if meth.match /_rule\z/
        rule = Rule.where(name: meth).first
        raise RuleNotFoundException, "Rule with name #{meth} not found!" unless rule
        rule.character = character
        rule.process
      else
        raise NoCharacterFieldFound, "No field :#{meth} in Character found! Define it to use in Rules." unless character.respond_to? meth 
        #Check for boolean method (to return explicit true/false)
        if meth.to_s.ends_with?("?")
          character.method(meth).call
        else
          character.method(meth).call || 'foobar'
        end
      end
    end
  end

  def handle_rule_condition(rule_hash)
    if rule_hash[:if].present?
      raise ConditionFailed unless !!eval(normalize(rule_hash[:if]))
    end
  end

  def handle_rule_body(rule_hash)
    begin
      eval(normalize(rule_hash[:what]))
    rescue SyntaxError, StandardError => e
      raise FaultyRule
    end
  end

  def handle_rule_storage(rule_hash, revert_mode: false)
    core = handle_rule_body(rule_hash)
    store_as = rule_hash[:store_as]
    if store_as
      raise NoStorageException , "Define #{store_as} in character to store #{name} value!" unless character.respond_to? "#{store_as}="
      return character.method("#{store_as}=").call(character.send(store_as.to_sym) - core) if revert_mode
      character.method("#{store_as}=").call(core)
      recalc_related_rules(store_as)
    else
      core
    end
  end

  def recalc_related_rules(store_as)
    #Reprocess rules that depends on stored value
    _mappings = RuleMapper.where(:name.ne => name, :store_as.ne => store_as,
                                 :method_list.in => [store_as, "#{store_as}_modifier".to_sym])
    names = _mappings.to_a.map(&:name)
    _rules = Rule.in(name: names).all
    _rules.each do |r|
      r.character = character
      r.process
    end unless _rules.empty?
  end

  class RuleNotFoundException < StandardError; end
  class NoStorageException < StandardError; end
  class NoCharacterFieldFound < StandardError; end
  class NoCharacterProvidedException < StandardError; end
  class ConditionFailed < StandardError; end
  class EmptyRuleException < StandardError; end
  class OneOffRepeatCall < StandardError; end
  class FaultyRule < StandardError; end
end
