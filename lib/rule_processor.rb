class RuleProcessor
  attr_reader :character, :logger, :stages

  def initialize(character)
    @stages = [1,2,3,4,5,6,7,:all]
    @character = character
    @logger = Logger.new(Rails.root.join("log", "rules.log"))
    @df1 = Rails.root.join("log", "df1.txt")
    @df2 = Rails.root.join("log", "df2.txt")
  end

  def process(stage)
    manage stage
  end

  def revert(stage)
    manage stage, revert_mode: true
  end

  #def process_with_logger
    #_stage = validate_stages(stage)
    #logger.info "#{'='*10} Starting at: #{Time.now} #{'='*10} \n Character initial state: #{character.attributes.to_yaml} \n #{'-'*20}"
    #File.open(@df1, "w") { |f| f.write character.attributes.to_yaml }

    #rules = _stage == :all ? Rule : Rule.staged(_stage)
    #rules.all.each do |rule|
      #rule.character = character
      #begin
        #rule.process
        #logger.info "Rule #{rule.name}: #{rule.attributes.to_yaml} \n #{'-'*20}"
      #rescue Rule::FaultyRule, Rule::ConditionFailed, StandardError => e
      #end
    #end

    #File.open(@df2, "w") { |f| f.write character.attributes.to_yaml }
    #logger.info "#{'-'*10} Diff: #{'-'*10} \n #{`diff #{@df1} #{@df2}`} \n #{'-'*20}"
  #end

  protected

  def manage(stage, revert_mode: false)
    rules = stage == :all ? Rule : Rule.staged(stage)
    rules.all.each do |rule|
      rule.character = character
      begin
        if revert_mode
          rule.revert
        else
          rule.process
        end
        logger.info "Rule #{rule.name}: #{rule.attributes.to_yaml} \n #{'-'*20}"
      rescue Rule::FaultyRule, Rule::ConditionFailed, StandardError => e
        Rails.logger.warn '=== '
        Rails.logger.warn e.message
        Rails.logger.warn e.backtrace.first
      end
    end
  end

  private

  def validate_stages(stage)
    raise OutOfStageRangeError, "Stage must be within 1..7" unless stages.include? stage
    stage
  end

  class OutOfStageRangeError < StandardError; end
end
