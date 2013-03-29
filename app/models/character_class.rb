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

  module Extensions
    #TODO CHECK!!!!
    [:cleric, :human].each do |race_name|
      define_method("#{race_name}?") do
        character_class.try(:name).try(:downcase) == race_name.to_s
      end
    end

    def hit_points_at_first_level
      character_class.try(:hit_points_at_first_level)
    end

    def hit_points_per_level
      character_class.try(:hit_points_per_level)
    end

    def healing_surges_per_day
      character_class.try(:healing_surges_per_day)
    end
  end

  def mandatory_skills
    Templates::Skill.in(keyword: mandatory_trained_skills).to_a
  end
end
