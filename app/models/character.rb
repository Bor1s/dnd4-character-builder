class Character < ActiveRecord::Base

  attr_accessor :hit_points, :healing_surges#, :healing_surge_value, :bloodied_value

  belongs_to :character_race
  belongs_to :character_class

  store :ability_scores, accessors: [:constitution, :dexterity, :strength, :intelligence, :charisma, :wisdom]

  def constitution
    ability_scores[:constitution] || 0
  end

  def constitution_modifier
    AbilityScoreGenerator.modifier_of(constitution)
  end

  #NOTE Character Class delegation
  delegate :hit_points_at_first_level, to: :character_class
  delegate :healing_surges_per_day, to: :character_class

end
