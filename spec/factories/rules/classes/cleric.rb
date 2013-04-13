FactoryGirl.define do
  #This is Channel divinity: Divine Fortune, Turn Undead and Healing Word encounters
  factory :cleric_encounter_powers_known_rule, parent: :rule do
    name :cleric_encounter_powers_known_rule
    todo Hash[
      what: "{encounter_powers_known} + 3",
      if: "{cleric?}",
      store_as: :encounter_powers_known
    ]
  end

  factory :healers_lore_rule, parent: :rule do
    name :healers_lore_rule
    todo Hash[
      what: "{wisdom_modifier}",
      if: "{cleric?}",
      store_as: :healing_keyword_bonus
    ]
  end

  factory :turn_undead_burst_squares_first_lvl_rule, parent: :rule do
    name :turn_undead_burst_squares_first_lvl_rule
    todo Hash[
      what: "2",
      if: "{cleric?} and (1...11) === {level}",
      store_as: :turn_undead_burst_squares
    ]
  end

  factory :turn_undead_burst_squares_eleven_lvl_rule, parent: :rule do
    name :turn_undead_burst_squares_eleven_lvl_rule
    todo Hash[
      what: "5",
      if: "{cleric?} and (11...21) === {level}",
      store_as: :turn_undead_burst_squares
    ]
  end

  factory :turn_undead_burst_squares_twfirst_lvl_rule, parent: :rule do
    name :turn_undead_burst_squares_twfirst_lvl_rule
    todo Hash[
      what: "8",
      if: "{cleric?} and {level} >= 21",
      store_as: :turn_undead_burst_squares
    ]
  end

  factory :turn_undead_dice_amount_first_lvl_rule, parent: :rule do
    name :turn_undead_dice_amount_first_lvl_rule
    todo Hash[
      what: "1",
      if: "{cleric?} and (1...5) === {level}",
      store_as: :turn_undead_dice_amount
    ]
  end

  factory :turn_undead_dice_amount_fifth_lvl_rule, parent: :rule do
    name :turn_undead_dice_amount_fifth_lvl_rule
    todo Hash[
      what: "2",
      if: "{cleric?} and (5...11) === {level}",
      store_as: :turn_undead_dice_amount
    ]
  end

  factory :turn_undead_dice_amount_eleventh_lvl_rule, parent: :rule do
    name :turn_undead_dice_amount_eleventh_lvl_rule
    todo Hash[
      what: "3",
      if: "{cleric?} and (11...15) === {level}",
      store_as: :turn_undead_dice_amount
    ]
  end

  factory :turn_undead_dice_amount_fifteenth_lvl_rule, parent: :rule do
    name :turn_undead_dice_amount_fifteenth_lvl_rule
    todo Hash[
      what: "4",
      if: "{cleric?} and (15...21) === {level}",
      store_as: :turn_undead_dice_amount
    ]
  end

  factory :turn_undead_dice_amount_twfirst_lvl_rule, parent: :rule do
    name :turn_undead_dice_amount_twfirst_lvl_rule
    todo Hash[
      what: "5",
      if: "{cleric?} and (21...25) === {level}",
      store_as: :turn_undead_dice_amount
    ]
  end

  factory :turn_undead_dice_amount_twfifth_lvl_rule, parent: :rule do
    name :turn_undead_dice_amount_twfifth_lvl_rule
    todo Hash[
      what: "6",
      if: "{cleric?} and {level} >= 25",
      store_as: :turn_undead_dice_amount
    ]
  end

  factory :healing_word_burst_squares_first_lvl_rule, parent: :rule do
    name :healing_word_burst_squares_rule
    todo Hash[
      what: "5",
      if: "{cleric?} and (1...11) === {level}",
      store_as: :healing_word_burst_squares
    ]
  end

  factory :healing_word_burst_squares_el_lvl_rule, parent: :rule do
    name :healing_word_burst_squares_rule
    todo Hash[
      what: "10",
      if: "{cleric?} and (11...15) === {level}",
      store_as: :healing_word_burst_squares
    ]
  end

  factory :healing_word_burst_squares_fift_lvl_rule, parent: :rule do
    name :healing_word_burst_squares_rule
    todo Hash[
      what: "15",
      if: "{cleric?} and {level} >= 15",
      store_as: :healing_word_burst_squares
    ]
  end

  factory :healing_word_regain_dice_fst_lvl_rule, parent: :rule do
    name :healing_word_regain_dice_rule
    todo Hash[
      what: "1",
      if: "{cleric?} and (1...6) === {level}",
      store_as: :healing_word_regain_dice
    ]
  end

  factory :healing_word_regain_dice_six_lvl_rule, parent: :rule do
    name :healing_word_regain_dice_rule
    todo Hash[
      what: "2",
      if: "{cleric?} and (6...11) === {level}",
      store_as: :healing_word_regain_dice
    ]
  end

  factory :healing_word_regain_dice_el_lvl_rule, parent: :rule do
    name :healing_word_regain_dice_rule
    todo Hash[
      what: "3",
      if: "{cleric?} and (11...16) === {level}",
      store_as: :healing_word_regain_dice
    ]
  end

  factory :healing_word_regain_dice_sixt_lvl_rule, parent: :rule do
    name :healing_word_regain_dice_rule
    todo Hash[
      what: "4",
      if: "{cleric?} and (16...21) === {level}",
      store_as: :healing_word_regain_dice
    ]
  end

  factory :healing_word_regain_dice_tw_lvl_rule, parent: :rule do
    name :healing_word_regain_dice_rule
    todo Hash[
      what: "5",
      if: "{cleric?} and (21...26) === {level}",
      store_as: :healing_word_regain_dice
    ]
  end

  factory :healing_word_regain_dice_tws_lvl_rule, parent: :rule do
    name :healing_word_regain_dice_rule
    todo Hash[
      what: "6",
      if: "{cleric?} and {level} >= 26",
      store_as: :healing_word_regain_dice
    ]
  end

  factory :lance_of_faith_hit_dice_fst_lvl_rule, parent: :rule do
    name :lance_of_faith_hit_dice_fst_lvl
    todo Hash[
      what: "1",
      if: "{cleric?} and (1...21) === {level}",
      store_as: :lance_of_faith_hit_dice
    ]
  end

  factory :lance_of_faith_hit_dice_twfst_lvl_rule, parent: :rule do
    name :lance_of_faith_hit_dice_twfst_lvl
    todo Hash[
      what: "2",
      if: "{cleric?} and {level} >= 21",
      store_as: :lance_of_faith_hit_dice
    ]
  end
end
