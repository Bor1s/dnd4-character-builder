class Rule
  include Mongoid::Document
  attr_accessor :character

  field :todo, type: Hash
  field :name, type: String

  def process
    raise EmptyRuleException, "Rule #{self.inspect} has empty :todo field!" unless todo 
    parse(todo) 
  end

  protected

  def parse(rule_hash)
    hash = rule_hash.with_indifferent_access
    raise NoCharacterProvidedException, "No character instance provided!" unless character

    what = normalize(hash[:what])
    store_as = hash[:store_as]

    result = nil

    if hash[:if].present?
      condition = normalize(hash[:if])
      if !!eval(condition)
        result = eval(what)
      else
        raise ConditionFailed
      end
    else
      result = eval(what)
    end

    if store_as
      raise NoStorageForRuleResultException, "Define #{store_as} in character to store #{name} value!" unless character.respond_to? "#{store_as}="
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
        rule.command = command
        rule.process
      else
        raise NoCharacterFieldFound, "No field :#{meth} in Character found! Define it to use in Rules." unless character.respond_to? meth 
        if meth.to_s.ends_with?("?") #Check for boolean method (to return explicit true/false)
          character.method(meth).call
        else
          character.method(meth).call || 0
        end
      end
    end
  end

  private

  def recalc_related_rules(store_as)
    #TODO refactor
    _rules = Rule.all.to_a.select do |r|
      r.todo["what"].match(/{#{store_as}}|{#{store_as}_modifier}/) && 
        r.name != name &&
          r.todo["store_as"] != store_as
    end
    _rules.each do |r|
      r.character = character
      r.process
    end unless _rules.empty?
  end

  class RuleNotFoundException < StandardError; end
  class NoStorageForRuleResultException < StandardError; end
  class NoCharacterFieldFound < StandardError; end
  class NoCharacterProvidedException < StandardError; end
  class ConditionFailed < StandardError; end
  class EmptyRuleException < StandardError; end
end
