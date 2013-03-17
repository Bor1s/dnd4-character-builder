class Templates::Klass
  include Mongoid::Document

  field :name, type: String
  field :healing_surge_value, type: Integer
  field :hit_points_at_first_level, type: Integer
  field :hit_points_per_level, type: Integer
  field :healing_surges_per_day, type: Integer
  field :trained_skills_count, type: Integer
  field :mandatory_trained_skills, type: Array
end
