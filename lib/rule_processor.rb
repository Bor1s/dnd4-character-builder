class RuleProcessor
  attr_reader :character, :command

  def initialize(character)
    @character = character
    @command = Command.new
  end

  def process
    #raise NoRootRulesException, "No root rules found to process." unless Rule.roots.exists?
    Rule.roots.each do |rule|
      rule.character = character
      rule.command = command
      begin
        rule.process
        command.execute
      rescue Rule::ConditionFailed => e
        puts "Rule #{rule.name} failed to process with conditions: #{rule.todo.inspect}"
      end
    end
  end

end
