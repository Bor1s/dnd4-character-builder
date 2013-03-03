require 'spec_helper'

describe Rest::CharactersController do
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

    it "returns success" do
      character_params = { character_race_attributes:
                           { name: "Dragonborn",
                             description: "Proud, honorable warriors, born from the blood of an ancient dragon god",
                             size: "medium",
                             vision: "normal",
                             speed: 6 }
      }
      put :update, { id: character.id, character: character_params }
      body = JSON.parse(response.body)
      body.should include("success", "character")
    end
  end
end
