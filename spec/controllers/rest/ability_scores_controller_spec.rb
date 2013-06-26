require 'spec_helper'

describe Rest::AbilityScoresController do
  it "#standard_array returns proper data" do
    get :standard_array, format: :json
    body = JSON.parse(response.body)
    body["ability_scores"].should eq AbilityScoreGenerator.standard_array
  end

  it "#roll_ability_scores returns 6 random numbers" do
    get :roll_ability_scores, format: :json
    body = JSON.parse(response.body)
    body["ability_scores"].should have(6).items
  end

  context "#custom_ability_scores" do
    it "returns valid spend points for 1-3 level" do
      pending 'Implement lib at first'
      get :custom_ability_scores, format: :json
    end
  end
end
