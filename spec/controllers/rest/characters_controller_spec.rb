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
    let(:character_params) do
      {
        character_race_attributes: FactoryGirl.attributes_for(:dragonborn_template),
        character_class_attributes: FactoryGirl.attributes_for(:cleric_template)
      }
    end

    it "returns success" do
      put :update, { id: character.id, character: character_params }
      body = JSON.parse(response.body)
      body.should include("success", "character")
    end
  end
end
