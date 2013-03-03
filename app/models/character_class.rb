class CharacterClass
  include Mongoid::Document

  embedded_in :character

  field :name, type: String
  field :healing_surge_value, type: Integer
  field :hit_points_at_first_level, type: Integer
  field :hit_points_per_level, type: Integer
  field :healing_surges_per_day, type: Integer
  field :trained_skills_count, type: Integer

  module Extensions
    def cleric?
      character_class.try(:name) == "cleric"
    end

    #TODO could be replaced with .delegate
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
