class RuleProcessor
  attr_reader :character

  def initialize(character)
    @character = character
  end

  def process
    Rule.roots.each do |rule|
      rule.character = character
      rule.process
    end
  end

end
