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
  belongs_to :character_class, class_name: 'CharacterClass'
  has_and_belongs_to_many :feats
  has_and_belongs_to_many :powers
  has_many :one_off_rules_flags, dependent: :destroy

  #Grant all feats and powers in system to character
  after_initialize do |char|
    #TODO think about how power and feats implementation
  end

  #TODO implement later
  #Available feats allows character to use it later (check in dropdown list on UI)
  #feat_names.each do |fn|
    #define_method("grant_#{fn}_feat") do
      #feats.where(name: fn).first.update_attributes(available: true)
    #end
  #end

end
