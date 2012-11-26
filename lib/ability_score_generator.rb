class AbilityScoreGenerator

  class << self
    #Plain array of values to use for 6 ability scores. Choose rest one fornext ability score.
    # @return [Array] 
    def standard_array 
      [16, 14, 13, 12, 11, 10]
    end

    # Start scores and points to spend for upgrading (See score_up_cost table).
    # @return [Hash<Array, Integer>] 
    def custom_ability_scores
      { scores: [8, 10, 10, 10, 10, 10], spend_points: 22 }
    end

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

    protected

    # @param [Integer(1..30)] Ability score to calculate it's modifier.
    # @return [Integer] Positive or negative modifier.
    def modifier_of(ability_score)
      raise "Ability score must be > 0" if ability_score < 1
      level_difference = 5
      balancer = ability_score.odd? ? 1 : 0
      ability_score - (ability_score / 2) - level_difference - balancer
    end

    #NOTE Calculation of ability scores should happen on client-side according to this table.
    # @params [Integer] Score value to get it's upgrading cost.
    # @return [Integer] Score cost value
    def score_up_cost(score)
      case score
        when (8..11) then 1
        when 12 then 2
        when 13 then 3
        when 14 then 5
        when 15 then 7
        when 16 then 9
        when 17 then 12
        when 18 then 16
        else
          raise "No such score in table!"
      end
    end

  end
end
