require 'spec_helper'

describe Rest::SkillsController do
  it "#index lists all available skills" do
    get :index, format: :json
    body = JSON.parse(response.body)
    body.should include("success", "skills")
    body["skills"].should have(17).items
  end

  it "#trained_skills defines wich skill is mandatory trained for character" do
    character = build_character(race: :dragonborn_character, level: 1)

    get :trained, { format: :json, character_id: character.id }
    body = JSON.parse(response.body)
    body.should include("success", "total", "value_for_train", "mandatory_skills")
    body["mandatory_skills"].should_not be_empty
  end
end
