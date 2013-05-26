class Rule
  include Mongoid::Document
  attr_accessor :character

  field :todo, type: Hash
  field :name, type: String
  field :one_off, type: Boolean, default: false

  def process
    raise EmptyRuleException, "Rule #{self.inspect} has empty :todo field!" unless todo
    RuleMapper.store(self)
    parse(todo)
  end

  protected

  def parse(rule_hash)
    hash = rule_hash.with_indifferent_access
    raise NoCharacterProvidedException, "No character instance provided!" unless character

    what = normalize(hash[:what])
    store_as = hash[:store_as]

    if hash[:if].present?
      condition = normalize(hash[:if])
      raise ConditionFailed unless !!eval(condition)
    end
    
    begin
      result = eval(what)
    rescue SyntaxError, StandardError => e
      raise FaultyRule
    end

    if store_as
      raise NoStorageForRuleResultException, "Define #{store_as} in character to store #{name} value!" unless character.respond_to? "#{store_as}="
      handle_one_offs
      character.method("#{store_as}=").call(result)
      recalc_related_rules(store_as)
    else
      result
    end
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
        if meth.to_s.ends_with?("?") #Check for boolean method (to return explicit true/false)
          character.method(meth).call
        else
          character.method(meth).call || 'foobar'
        end
      end
    end
  end

  private

  def recalc_related_rules(store_as)
    #Reprocess rules that depends on stored value
    _mappings = RuleMapper.where(:name.ne => name, :store_as.ne => store_as, :method_list.in => [store_as, "#{store_as}_modifier".to_sym])
    names = _mappings.to_a.map(&:name)
    _rules = Rule.in(name: names).all

    _rules.each do |r|
      r.character = character
      r.process
    end unless _rules.empty?
  end

  def handle_one_offs
    if self.one_off?
      if character.one_off_rules_flags.where(rule_id: self.id, level: character.level).exists?
        raise OneOffRepeatCall, "Attempt to call '#{self.name}' more then once!"
      else
        #TODO add :stage field to know on which stage rule hah been added and then easily remove it
        #from OneOffRulesFlags if user wants to recreate race, class, ability scores etc.
        character.one_off_rules_flags.create(rule_id: self.id, level: character.level)
      end
    end
  end


  class RuleNotFoundException < StandardError; end
  class NoStorageForRuleResultException < StandardError; end
  class NoCharacterFieldFound < StandardError; end
  class NoCharacterProvidedException < StandardError; end
  class ConditionFailed < StandardError; end
  class EmptyRuleException < StandardError; end
  class OneOffRepeatCall < StandardError; end
  class FaultyRule < StandardError; end
end
