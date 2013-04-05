class Templates::Klass
  include Mongoid::Document

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

  module Extensions
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
end
