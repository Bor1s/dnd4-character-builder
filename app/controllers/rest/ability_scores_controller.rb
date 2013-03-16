class Rest::AbilityScoresController < ApplicationController

  def standard_array
    render json: AbilityScoreGenerator.standard_array
  end

  def custom_ability_scores
    render json: AbilityScoreGenerator.custom_ability_scores
  end

  def roll_ability_scores
    render json: AbilityScoreGenerator.roll_ability_scores
  end
end
