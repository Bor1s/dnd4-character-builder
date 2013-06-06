class Character
  include Mongoid::Document

  include Vaults::General
  include Vaults::Race
  include Vaults::CharacterClass
  include Vaults::Skills
  include Vaults::Feats
  include Vaults::Powers
  include Vaults::AbilityScores
  include Vaults::Defences

  belongs_to :race
  belongs_to :character_class
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :feats
  has_and_belongs_to_many :powers
  has_many :one_off_rules_flags, dependent: :destroy

  #Grant all feats and powers in system to character
  #after_initialize do |char|
    #char.feats_attributes = Templates::Feat.all.map { |f| f.attributes.except("_id") } if char.new_record?
    #char.powers_attributes = Templates::Power.all.map { |f| f.attributes.except("_id") } if char.new_record?
    #char.skills_attributes = Templates::Skill.all.map { |f| f.attributes.except("_id") } if char.new_record?
  #end

  #Available feats allows character to use it later (check in dropdown list on UI)
  #feat_names.each do |fn|
    #define_method("grant_#{fn}_feat") do
      #feats.where(name: fn).first.update_attributes(available: true)
    #end
  #end

end
