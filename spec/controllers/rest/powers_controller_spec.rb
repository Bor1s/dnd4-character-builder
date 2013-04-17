require 'spec_helper'

describe Rest::PowersController do
  context "#available" do
    it "returns only available powers" do
      character = build_character(type: :dragonborn_cleric, level: 1)
      get :available, { format: :json, character_id: character.id }
      result = JSON.parse response.body
      result["success"].should be_true
      result["powers"].should have(5).items
    end

    it "returns error if no character found" do
      get :available, { format: :json, character_id: "unexisting ID" }
      result = JSON.parse response.body
      result["success"].should be_false
      result["error"].should be
    end
  end
end
