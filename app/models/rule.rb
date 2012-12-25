class Rule < ActiveRecord::Base
  include SemanticOperators

  serialize :performs
  serialize :as_soon_as, Array

  scope :roots, ->(){ where(root: true) }

  attr_accessor :character

  def process
    # TODO implements logger
    #return "Rule #{self.name} does not satisfy conditions!" unless parse_as_soon_as

    return unless parse_as_soon_as
    return parse_performs unless root?
    
    result_storage = store_to || name.to_s.gsub(/_rule\z/, '')
    unless character.respond_to? "#{result_storage}="
      raise NoStorageForRuleResultException, "Accessor :#{result_storage} should be defined in character to store #{name} value!" 
    end
    character.method("#{result_storage}=").call(parse_performs)
  end

  protected

  def parse_performs
    how = performs[:how]
    normalized_what = normalize_what(performs[:what])

    if normalized_what.is_a? Array
      normalized_what.reduce(how)
    else
      normalized_what
    end
  end

  def parse_as_soon_as
    as_soon_as.all? do |condition|
      operand1 = condition.keys.first
      operator = condition[operand1].keys.first
      operand2 = condition[operand1][operator]
      
      #TODO Raise exception when operator is not found. Add specs for it.
      method(operator).call(determine(operand1), determine(operand2))
    end
  end

  def normalize_what(something)
    case something.class.name
    when "Array"
      something.map do |thing|
        if thing.is_a? Symbol
          determine(thing)
        else
          thing
        end
      end.compact #Removes rules with unsuccessful conditions
    when "Symbol"
      determine(something)
    else
      something
    end
  end

  def determine(value)
    if [Symbol].include? value.class
      if value.match(/.+_rule\z/)
        rule = Rule.where(name: value).first
        raise RuleNotFoundException, "Rule with name #{value} not found!" unless rule
        rule.character = character
        rule.process
      else
        raise NoCharacterFieldFound, "No field :#{value} in Character found! Define it to use in Rules." unless character.respond_to? value
        character.method(value).call
      end
    else
      value
    end
  end

  class RuleNotFoundException < StandardError; end
  class NoStorageForRuleResultException < StandardError; end
  class NoCharacterFieldFound < StandardError; end
end
