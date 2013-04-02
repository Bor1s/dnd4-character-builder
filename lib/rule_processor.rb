class RuleProcessor
  attr_reader :character, :command, :logger

  def initialize(character)
    @character = character
    @command = Command.new
    @logger = Logger.new(Rails.root.join("log", "rules.log"))
    @df1 = Rails.root.join("log", "df1.txt")
    @df2 = Rails.root.join("log", "df2.txt")
  end

  def process
    #raise NoRootRulesException, "No root rules found to process." unless Rule.roots.exists?
    logger.info "#{'='*10} Starting at: #{Time.now} #{'='*10} \n Character initial state: #{character.attributes.to_yaml} \n #{'-'*20}"
    File.open(@df1, "w") { |f| f.write character.attributes.to_yaml }

    Rule.all.each do |rule|
      rule.character = character
      rule.command = command
      begin
        rule.process
        command.execute
        logger.info "Rule #{rule.name}: #{rule.attributes.to_yaml} \n #{'-'*20}"
      rescue Rule::ConditionFailed => e
        #logger.info "Rule #{rule.name} failed to process with conditions: #{rule.todo.inspect}"
      end
    end

    File.open(@df2, "w") { |f| f.write character.attributes.to_yaml }
    logger.info "#{'-'*10} Diff: #{'-'*10} \n #{`diff #{@df1} #{@df2}`} \n #{'-'*20}"
  end

end
