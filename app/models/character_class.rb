class CharacterClass #< ActiveRecord::Base
  attr_accessor :type, :role, :power_source, :key_abilities,
    :armor_proficiencies, :weapon_proficiencies, :implement,
    :defence_bonus, :basic_hit_points, :per_level_hit_points, :healing_surges_per_day,
    :trained_skills, :build_options, :class_features
end
