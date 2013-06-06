module Vaults::General
  def self.included(base)
    base.class_exec do
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

      field :turn_undead_burst_squares, type: Integer
      field :healing_keyword_bonus, type: Integer
      field :turn_undead_dice_amount, type: Integer
      field :healing_word_burst_squares, type: Integer
      field :healing_word_regain_dice, type: Integer
      field :lance_of_faith_hit_dice, type: Integer
      field :priests_shield_hit_dice, type: Integer
    end

    base.class_eval do
      #Armor and weapon
      def has_lightweight_armor?
        #TODO check for this type of armor
        true
      end
    end
  end
end
