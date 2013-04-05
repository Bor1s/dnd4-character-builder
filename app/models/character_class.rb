class CharacterClass
  include Mongoid::Document

  embedded_in :character

  field :name, type: String
  field :healing_surge_value, type: Integer
  field :hit_points_at_first_level, type: Integer
  field :hit_points_per_level, type: Integer
  field :healing_surges_per_day, type: Integer
  field :trained_skills_count, type: Integer
  field :mandatory_trained_skills, type: Array
  field :armor_proficiencies, type: Array
  field :weapon_proficiencies, type: Array
  field :implement, type: String
  field :features, type: Array

  def mandatory_skills
    Templates::Skill.in(keyword: mandatory_trained_skills).to_a
  end
end
