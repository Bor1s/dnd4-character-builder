class AbilityScoreGenerator
  SCORES_BY_LEVEL = [
    {1 => {spend_points: 22}},
    {4 => {spend_points: 2}},
    {8 => {spend_points: 2}},
    {11 => {to_all_value: 1}},
    {14 => {spend_points: 2}},
    {18 => {spend_points: 2}},
    {21 => {to_all_value: 1}},
    {24 => {spend_points: 2}},
    {28 => {spend_points: 2}},
  ]

  class << self
    #Plain array of values to use for 6 ability scores. Choose rest one fornext ability score.
    # @return [Array] 
    def standard_array 
      [16, 14, 13, 12, 11, 10]
    end

    # Start points to spend for upgrading (See score_up_cost table).
    # Depends of character level.
    # @return [Hash<Array, Integer>] 
    def custom_ability_scores(from_level, to_level)
      intermidiate_points = SCORES_BY_LEVEL.select {|s| s.keys.first > from_level and s.keys.first <= to_level }
      points = intermidiate_points.inject([]) { |acc,h| acc += h.values; acc }
      points.inject({spend_points: 0, to_all_value: 0}) do |acc,ip|
        acc[:spend_points] += ip[:spend_points].to_i
        acc[:to_all_value] += ip[:to_all_value].to_i
        acc
      end
    end

    # Randomly generated ability scores
    def roll_ability_scores
      result_ability_scores = []

      6.times do
        _rand_values = []
        4.times { _rand_values << rand(1..6) }
        result_ability_scores << _rand_values.sort.reverse.take(3).sum
      end
      
      result = result_ability_scores.map { |as| modifier_of(as) }.sum
      (4..8) === result ? result_ability_scores : roll_ability_scores
    end

    # @param [Integer(1..30)] Ability score to calculate it's modifier.
    # @return [Integer] Positive or negative modifier.
    def modifier_of(ability_score)
      return 0 unless ability_score
      #TODO implement logger with warnings
      #raise "Ability score must be > 0" if ability_score.nil? || ability_score < 1
      level_difference = 5
      balancer = ability_score.odd? ? 1 : 0
      ability_score - (ability_score / 2) - level_difference - balancer
    end

    #NOTE Calculation of ability scores should happen on client-side according to this table.
    # @params [Integer] Score value to get it's upgrading cost.
    # @return [Integer] Score cost value
    def score_up_cost(score)
      #NOTE numbers were taken from Character Build Desktop
      case score
        when (8..13) then 1
        when (14..16) then 2
        when 17 then 3
        when 18 then 4
        else
          raise ScoreValueError, "No such score in table!"
      end
    end

    def spend_points_transition_calc(from_score, to_score)
      if to_score > from_score
        #Increasing score
        raise ScoreValueError, "No such score in table!" if to_score > 18
        score_up_cost(to_score)
      else
        #Decreasing score
        raise ScoreValueError, "No such score in table!" if to_score < 8
        score_up_cost(from_score)
      end
    end

  end

  class ScoreValueError < StandardError; end
end
