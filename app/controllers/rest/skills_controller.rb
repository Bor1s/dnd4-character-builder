class Rest::SkillsController < ApplicationController

  def index
    skills = Templates::Skill.all
    unless skills.empty?
      result = { success: true, skills: skills }
    else
      result = { success: false, error: "No skills found!" }
    end
    render json: result
  end

  def trained
    character = Character.where(id: params[:character_id]).first
    if character
      result = {
        success: true,
        total: character.character_class.trained_skills_count,
        value_for_train: 5,
        mandatory_skills: character.character_class.mandatory_skills
      }
    else
      result = { success: false, error: "No character found!" }
    end
    render json: result
  end
end
