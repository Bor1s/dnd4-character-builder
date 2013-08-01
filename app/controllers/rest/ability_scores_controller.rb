class Rest::AbilityScoresController < ApplicationController

  def names
    render json: ['Str', 'Con', 'Dex', 'Int', 'Wis', 'Cha']
  end

  def standard_array
    render json: { success: true, ability_scores: AbilityScoreGenerator.standard_array }
  end

  def roll_ability_scores
    render json: { success: true, ability_scores: AbilityScoreGenerator.roll_ability_scores }
  end

  def custom_ability_scores
    render json: { success: true, ability_scores: AbilityScoreGenerator.custom_ability_scores(params[:from_level].to_i, params[:to_level].to_i) }
  end

  def score_cost
    begin
      cost = AbilityScoreGenerator.spend_points_transition_calc(params[:from].to_i, params[:to].to_i)
      result = { success: true, cost: cost }
    rescue => e
      result = { success: false, error: e.message }
    ensure
      render json: result
    end
  end
end
