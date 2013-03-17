require 'spec_helper'

describe Rest::CharactersController do
  context "#index" do
    pending "Implement"
  end

  context "#show" do
    pending "Implement"
  end

  context "#create" do
    it "blank character for further processing" do
      post :create, { format: :json }
      body = JSON.parse(response.body)
      body.should include("success", "id")
      body["success"].should be_true
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
    #All skills MUST be always present in JSON 
    let(:character_params) do
      {
        level: 1,
        character_race_attributes: FactoryGirl.attributes_for(:dragonborn_template),
        character_class_attributes: FactoryGirl.attributes_for(:cleric_template),
        skills_attributes: [
          {name: "Religion", keyword: "religion", trained: true, value: 7},
          {name: "Acrobatics", keyword: "acrobatics", value: 0},
          {name: "Arcana", keyword: "arcana", trained: true, value: 5},
          {name: "Athletics", keyword: "athletics", value: 0},
          {name: "Bluff", keyword: "bluff", value: 0},
          {name: "Diplomacy", keyword: "diplomacy", trained: true, value: 8},
          {name: "Dungeoneering", keyword: "dungeoneering", value: 0},
          {name: "Endurance", keyword: "endurance", value: 0},
          {name: "Heal", keyword: "heal", value: 0},
          {name: "History", keyword: "history", value: 0},
          {name: "Insight", keyword: "insight", value: 0},
          {name: "Intimidate", keyword: "intimidate", value: 0},
          {name: "Nature", keyword: "nature", value: 0},
          {name: "Perception", keyword: "perception", value: 0},
          {name: "Stealth", keyword: "stealth", value: 0},
          {name: "Streetwise", keyword: "streetwise", value: 0},
          {name: "Thievery", keyword: "thievery", value: 0}
        ],
        strength: 13,
        dexterity: 14,
        constitution: 15,
        charisma: 13,
        intelligence: 12,
        wisdom: 10
      }
    end

    it "returns success" do
      put :update, { id: character.id, character: character_params }
      body = JSON.parse(response.body)
      body.should include("success", "character")
      body["success"].should be_true
      body["character"].should be
    end
  end
end
