require 'spec_helper'

describe Rest::CharactersController do
  context "#index" do
    it "returns list of all characters" do
      Character.stub(:all).and_return([Character.new])
      get :index, format: :json
      body = JSON.parse(response.body)
      body.should include("success", "characters")
      body["characters"].should_not be_empty
    end

    it "returns success: false if no characters found" do
      Character.stub(:all).and_return([])
      get :index, format: :json
      body = JSON.parse(response.body)
      body.should include("success", "error")
      body["success"].should be_false
    end
  end

  context "#show" do
    it "returns character" do
      character = build_character(type: :dragonborn_cleric, level: 1)
      Character.should_receive(:where).and_return([character])
      get :show, { id: character.id, format: :json }
      body = JSON.parse(response.body)
      body.should include("success", "character")
      body["character"].should be
    end

    it "returns success: false if no characters found" do
      get :show, { id: "unexisting-id", format: :json }
      body = JSON.parse(response.body)
      body.should include("success", "error")
      body["success"].should be_false
    end
  end

  context "#create" do
    it "blank character for further processing" do
      post :create, { format: :json }
      body = JSON.parse(response.body)
      body.should include("success", "character")
      body["success"].should be_true
      body["character"].should be
    end

    it "returns error if something went wrong" do
      Character.should_receive(:create!).and_raise
      post :create, { format: :json }
      body = JSON.parse(response.body)
      body.should include("success", "error")
      body["success"].should be_false
    end
  end

  context "#update" do
    let(:character) { Character.create! }
    #NOTE All skills MUST be always present in JSON
    let(:character_params) do
      {
        level: 1,
        character_race_id: FactoryGirl.create(:dragonborn).id,
        character_class_id: FactoryGirl.create(:cleric).id,
        religion: 7,
        acrobatics: 0,
        arcana: 5,
        athletics: 0,
        bluff: 0,
        diplomacy: 8,
        dungeoneering: 0,
        endurance: 0,
        heal: 0,
        history: 0,
        insight: 0,
        intimidate: 0,
        nature: 0,
        perception: 0,
        stealth: 0,
        streetwise: 0,
        thievery: 0,
        strength: 13,
        dexterity: 14,
        constitution: 15,
        charisma: 13,
        intelligence: 12,
        wisdom: 10
      }
    end

    #TODO think how to organize specs for different stages
    it "returns success" do
      put :update, { id: character.id, character: character_params, stage: 1 }
      body = JSON.parse(response.body)
      body.should include("success", "character")
      body["success"].should be_true
      body["character"].should be
      p body["character"]
    end
    
    it "returns success and rules marked by current stage" do
      put :update, { id: character.id, character: character_params, stage: 1 }
      body = JSON.parse(response.body)
      body.should include("success", "character")
      body["success"].should be_true
      body["character"].should be
    end
  end
end
