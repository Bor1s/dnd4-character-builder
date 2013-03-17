class Rest::AbilityScoresController < ApplicationController

  def standard_array
    render json: { success: true, ability_scores: AbilityScoreGenerator.standard_array }
  end

  def custom_ability_scores
    render json: { success: true, ability_scores: AbilityScoreGenerator.custom_ability_scores }
  end

  def roll_ability_scores
    render json: { success: true, ability_scores: AbilityScoreGenerator.roll_ability_scores }
  end
end
