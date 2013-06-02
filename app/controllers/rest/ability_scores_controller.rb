class Rest::AbilityScoresController < ApplicationController

  def names
    render json: ['Str', 'Con', 'Dex', 'Int', 'Wis', 'Cha']
  end

  def standard_array
    render json: { success: true, ability_scores: AbilityScoreGenerator.standard_array }
  end

  def custom_ability_scores
    render json: { success: true, ability_scores: AbilityScoreGenerator.custom_ability_scores }
  end

  def roll_ability_scores
    render json: { success: true, ability_scores: AbilityScoreGenerator.roll_ability_scores }
  end

  def score_cost
    #TODO write specs
    from_score = params[:from].to_i
    to_score = params[:to].to_i
    begin
      cost = AbilityScoreGenerator.spend_points_transition_calc(from_score, to_score)
      result = { success: true, cost: cost }
    rescue => e
      result = { success: false, error: e.message }
    ensure
      render json: result
    end
  end
end
