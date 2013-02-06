class Character < ActiveRecord::Base
  attr_accessor :hit_points, :healing_surges,
    :healing_surge_value, :bloodied, :atwill_powers_known,
    :encounter_powers_known, :daily_powers_known,
    :expirience, :feats_known, :utility_powers_known,
    :ability_scores_upgrade_points

  store :ability_scores, accessors: [:strength, :dexterity, :constitution, :charisma, :intelligence, :wisdom]

  has_many :character_skills, dependent: :destroy
  has_many :skills, through: :character_skills
  
  has_and_belongs_to_many :languages

  belongs_to :character_race
  belongs_to :character_class

  #Ability scores
  def strength_modifier
    AbilityScoreGenerator.modifier_of(strength)
  end

  def dexterity_modifier
    AbilityScoreGenerator.modifier_of(dexterity)
  end

  def constitution_modifier
    AbilityScoreGenerator.modifier_of(constitution)
  end

  def constitution_increased?
    #TODO implement
  end

  def constitution_increased_to_even?
    #TODO implement
  end

  def charisma_modifier
    AbilityScoreGenerator.modifier_of(charisma)
  end

  def intelligence_modifier
    AbilityScoreGenerator.modifier_of(intelligence)
  end

  def wisdom_modifier
    AbilityScoreGenerator.modifier_of(wisdom)
  end

  #Character race
  include ::CharacterRace::Extensions

  #Character skills accessors
  include ::Skill::Extensions

  #NOTE Character Class delegation
  include ::CharacterClass::Extensions
  delegate :hit_points_at_first_level, to: :character_class
  delegate :hit_points_per_level, to: :character_class
  delegate :healing_surges_per_day, to: :character_class

  def level_multiplier
    level == 1 ? 0 : level
  end

end
