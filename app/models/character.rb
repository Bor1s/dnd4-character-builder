class Character < ActiveRecord::Base

  attr_accessor :hit_points, :healing_surges,
    :healing_surge_value, :bloodied, :encounter_powers_known,
    :expirience

  has_many :ability_scores, dependent: :destroy

  has_many :character_skills, dependent: :destroy
  has_many :skills, through: :character_skills

  belongs_to :character_race
  belongs_to :character_class

  #Ability scores accessors and modifiers getters
  include ::AbilityScore::Extensions

  #Character race
  def race
    character_race.name.downcase
  end

  #Character skills accessors
  include ::Skill::Extensions

  #NOTE Character Class delegation
  delegate :hit_points_at_first_level, to: :character_class
  delegate :healing_surges_per_day, to: :character_class

end
