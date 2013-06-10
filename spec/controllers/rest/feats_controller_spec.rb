require 'spec_helper'

describe Rest::FeatsController do
  context "#index" do
    it "returns list of feats" do
      pending 'Implement feats'
      get :index
      result = JSON.parse response.body
      result["success"].should be_true
      result["feats"].should_not be_empty
    end

    it "returns empty result" do
      pending 'Implement feats'
      Templates::Feat.stub(:all).and_return([])
      get :index
      result = JSON.parse response.body
      result["success"].should be_false
      result["error"].should be
    end
  end

  context "#available" do
    it "returns only available feats" do
      pending 'Implement feats'
      character = build_character(type: :dragonborn_cleric, level: 8)
      get :available, { format: :json, character_id: character.id }
      result = JSON.parse response.body
      result["success"].should be_true
      result["feats"].should have(2).items
    end

    it "returns error if no character found" do
      pending 'Implement feats'
      get :available, { format: :json, character_id: "unexisting ID" }
      result = JSON.parse response.body
      result["success"].should be_false
      result["error"].should be
    end
  end
end
