class RuleProcessor
  attr_reader :character, :command

  def initialize(character)
    @character = character
    @command = Command.new
  end

  def process
    Rule.roots.each do |rule|
      rule.character = character
      rule.command = command
      begin
        rule.process
        command.execute
      rescue => ConditionFailed
        puts "Rule #{rule} failed to process with it's conditions!"
      end
    end
  end

end
