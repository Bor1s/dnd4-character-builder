class Rule < ActiveRecord::Base
  include SemanticOperators

  serialize :performs
  serialize :as_soon_as, Array

  attr_accessor :character

  def process
    if parse_as_soon_as
      parse_performs
    else
      0
    end
  end

  def determine(value)
    if [String, Symbol].include? value.class
      if value.match(/.+_rule\z/)
        rule = Rule.where(name: value).first
        rule.character = character
        rule.process
      else
        character.method(value).call
      end
    else
      value
    end
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
      end
    when "Symbol"
      determine(something)
    else
      something
    end
  end
end
