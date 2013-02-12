class Character
  include Mongoid::Document

  field :name, type: String
  field :hit_points, type: Integer
  field :healing_surges, type: Integer
  field :healing_surge_value, type: Integer
  field :bloodied, type: Integer
  field :atwill_powers_known, type: Integer
  field :encounter_powers_known, type: Integer
  field :daily_powers_known, type: Integer
  field :feats_known, type: Integer
  field :utility_powers_known, type: Integer
  field :expirience, type: Integer
  field :ability_scores_upgrade_points, type: Integer
  field :level, type: Integer

  field :strength, type: Integer
  field :dexterity, type: Integer
  field :constitution, type: Integer
  field :charisma, type: Integer
  field :intelligence, type: Integer
  field :wisdom, type: Integer

  field :history, type: Integer
  field :intimidate, type: Integer

  embeds_many :skills
  embeds_many :languages
  embeds_one :character_class
  embeds_one :character_race
  #embeds_many :languages
  
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
  #include ::Skill::Extensions

  #NOTE Character Class delegation
  include ::CharacterClass::Extensions
  delegate :hit_points_at_first_level, to: :character_class
  delegate :hit_points_per_level, to: :character_class
  delegate :healing_surges_per_day, to: :character_class

  def level_multiplier
    level == 1 ? 0 : level
  end

end
