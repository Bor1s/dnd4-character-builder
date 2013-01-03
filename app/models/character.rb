class Character < ActiveRecord::Base
  attr_accessor :hit_points, :healing_surges,
    :healing_surge_value, :bloodied, :atwill_powers_known,
    :encounter_powers_known, :daily_powers_known,
    :expirience, :feats_known

  has_many :ability_scores, dependent: :destroy

  has_many :character_skills, dependent: :destroy
  has_many :skills, through: :character_skills
  
  has_and_belongs_to_many :languages

  belongs_to :character_race
  belongs_to :character_class

  #Ability scores accessors and modifiers getters
  include ::AbilityScore::Extensions

  #Character race
  include ::CharacterRace::Extensions

  #Character skills accessors
  include ::Skill::Extensions

  #NOTE Character Class delegation
  delegate :hit_points_at_first_level, to: :character_class
  delegate :hit_points_per_level, to: :character_class
  delegate :healing_surges_per_day, to: :character_class

  def level_multiplier
    level == 1 ? 0 : level
  end

end
