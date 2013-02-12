class Rule
  include Mongoid::Document
  attr_accessor :character, :command

  field :todo, type: Hash
  field :name, type: String
  field :root, type: Boolean

  scope :roots, where(root: true)

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
      condition = normalize(hash[:if]) #TODO rework normalize for :if (causing trobbles with name? style methods)
      if eval(condition)
        result = eval(what)
      else
        raise ConditionFailed
      end
    else
      result = eval(what)
    end

    if store_as
      raise NoStorageForRuleResultException, "Define #{store_as} in character to store #{name} value!" unless character.respond_to? "#{store_as}="
      command.add_to_queue( lambda {character.method("#{store_as}=").call(result)} )
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
        character.method(meth).call || 0
      end
    end
  end

  class RuleNotFoundException < StandardError; end
  class NoStorageForRuleResultException < StandardError; end
  class NoCharacterFieldFound < StandardError; end
  class NoCharacterProvidedException < StandardError; end
  class ConditionFailed < StandardError; end
  class EmptyRuleException < StandardError; end
end
