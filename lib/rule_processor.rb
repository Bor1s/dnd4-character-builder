class RuleProcessor
  attr_reader :character, :logger

  def initialize(character)
    @character = character
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
      begin
        rule.process
        logger.info "Rule #{rule.name}: #{rule.attributes.to_yaml} \n #{'-'*20}"
      rescue Rule::FaultyRule, Rule::ConditionFailed, Rule::OneOffRepeatCall, StandardError => e
      end
    end

    File.open(@df2, "w") { |f| f.write character.attributes.to_yaml }
    logger.info "#{'-'*10} Diff: #{'-'*10} \n #{`diff #{@df1} #{@df2}`} \n #{'-'*20}"
  end

end
