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

  field :fortitude, type: Integer
  field :will, type: Integer
  field :armor_class, type: Integer
  field :reflex, type: Integer

  #TODO implement :general_storage, power_storage etc. Hash to store values.
  # Improve Rule to search in storages instead of character.defined?(:store_method)

  #Misc
  field :turn_undead_burst_squares, type: Integer
  field :healing_keyword_bonus, type: Integer
  field :turn_undead_dice_amount, type: Integer
  field :healing_word_burst_squares, type: Integer
  field :healing_word_regain_dice, type: Integer
  field :lance_of_faith_hit_dice, type: Integer
  field :priests_shield_hit_dice, type: Integer

  embeds_many :skills
  embeds_many :languages
  embeds_many :feats
  embeds_many :powers
  embeds_one  :character_class, class_name: "CharacterClass" #Avoid CharacterClas bug
  embeds_one  :character_race

  accepts_nested_attributes_for :character_race
  accepts_nested_attributes_for :character_class
  accepts_nested_attributes_for :skills
  accepts_nested_attributes_for :feats
  accepts_nested_attributes_for :powers

  #Grant all feats and powers in system to character
  after_initialize do |char|
    char.feats_attributes = Templates::Feat.all.map { |f| f.attributes.except("_id") } if char.new_record?
    char.powers_attributes = Templates::Power.all.map { |f| f.attributes.except("_id") } if char.new_record?
  end
  
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
    constitution_changed? && constitution > (constitution_was || 0) #For pure character
  end

  def constitution_increased_to_even?
    constitution_increased? && constitution.even?
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

  def level_multiplier
    level == 1 ? 0 : level
  end

  #Armor and weapon
  def has_lightweight_armor?
    #TODO check for this type of armor
    true
  end

  #Character race extensions
  include ::Templates::Race::Extensions

  #Character Class extensions
  include ::Templates::Klass::Extensions

  #Character Skill extensions
  include ::Templates::Skill::Extensions

  #Character Feat extensions
  include ::Templates::Feat::Extensions

  #Available feats allows character to use it later (check in dropdown list on UI)
  feat_names.each do |fn|
    define_method("grant_#{fn}_feat") do
      feats.where(name: fn).first.update_attributes(available: true)
    end
  end

  #Character Power extensions
  include ::Templates::Power::Extensions
end
