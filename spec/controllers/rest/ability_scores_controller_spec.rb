require 'spec_helper'

describe Rest::AbilityScoresController do
  it "#standard_array returns proper data" do
    get :standard_array, format: :json
    body = JSON.parse(response.body)
    body["ability_scores"].should eq AbilityScoreGenerator.standard_array
  end

  it "#custom_ability_scores returns json with data to be used in JS framework" do
    get :custom_ability_scores, format: :json
    body = JSON.parse(response.body)
    body["ability_scores"].should eq AbilityScoreGenerator.custom_ability_scores.with_indifferent_access
  end

  it "#roll_ability_scores returns 6 random numbers" do
    get :roll_ability_scores, format: :json
    body = JSON.parse(response.body)
    body["ability_scores"].should have(6).items
  end
end
