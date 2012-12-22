class Character < ActiveRecord::Base

  attr_accessor :hit_points, :healing_surges, :healing_surge_value, :bloodied
  has_many :ability_scores, dependent: :destroy

  belongs_to :character_race
  belongs_to :character_class

  #Ability scores accessors and modifiers getters
  include ::AbilityScore::NamesAndModifiers

  #Character race
  def race
    character_race.name.downcase
  end

  #NOTE Character Class delegation
  delegate :hit_points_at_first_level, to: :character_class
  delegate :healing_surges_per_day, to: :character_class
end
