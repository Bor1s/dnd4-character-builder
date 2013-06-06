# --- Character powers: at_will, encounter, daily (utilities and attacks)

FactoryGirl.define do
  factory :power do

    factory :at_will do
      power_type :at_will
    end

    factory :encounter do
      power_type :encounter
    end

    factory :daily do
      power_type :daily
    end

    factory :utility do
      power_type :utility
    end
  end

# --- Cleric ---

  factory :divine_fortune_power, parent: :encounter do
    name :divine_fortune
    description "In the face of peril, you hold true to your faith and receive a special boon"
    keywords [:divine]
    action_type :free_action
    attack_type_and_range :personal
    effect "You gain a +1 bonus to your next attack roll or saving throw before the end of your next turn"
    used true
    available true
  end

  factory :turn_undead_power, parent: :encounter do
    name :turn_undead
    description "You sear undead foes, push them back, and root them in place"
    keywords [:divine, :implement, :radiant]
    action_type :standard_action
    attack_type_and_range "close burst {turn_undead_burst_squares} (2 at 1st, 5 at 11th level, 8 at 21st level)"
    power_target "Each undead creature in burst"
    attack "Wisdom vs. Will"
    hit "{turn_undead_dice_amount}d10 + {wisdom_modifier} radiant damage, and you push the target a number of squares equal to 3 + your {charisma_modifier}. The target is immobilized until the end of your next turn."
    miss "Half damage, and the target is not pushed or immobilized."
    used true
    available true
  end

  factory :healing_word_power, parent: :encounter do
    name :healing_word
    description "You whisper a brief prayer as divine light washes over your target, helping to mend its wounds"
    keywords [:divine, :healing]
    action_type :minor_action
    attack_type_and_range "close burst {healing_word_burst_squares} (10 at 11th level, 15 at 21st level)"
    power_target "You or one ally"
    effect "The target can spend a healing surge and regain an additional {healing_word_regain_dice}d6 + {healing_keyword_bonus} hit points"
    used true
    available true
  end

  # Cleric class powers:
  # Level 1

  factory :lance_of_faith_power, parent: :at_will do
    name :lance_of_faith
    description "A brilliant ray of light sears your foe with golden radiance. Sparkles of light linger around the target, guiding your ally's attack"
    keywords [:divine, :implement, :radiant]
    action_type :standard_action
    attack_type_and_range "ranged 5"
    power_target "One creature"
    attack "Wisdom vs. Reflex"
    hit "{lance_of_faith_hit_dice}d8 + {wisdom_modifier} radiant damage, and one ally you can see gains a +2 power bonus to his or her next attack roll against the target"
    available_from_level 1
  end

  factory :priests_shield_power, parent: :at_will do
    name :priests_shield
    description "You utter a minor defensive prayer as you attack with your weapon."
    keywords [:divine, :weapon]
    action_type :standard_action
    attack_type_and_range "melee weapon"
    power_target "One creature"
    attack "Strength vs. AC"
    hit "{priests_shield_hit_dice}[W] + Strength modifier damage, and you and one adjacent ally gain a +1 power bonus to AC until the end of your next turn"
    available_from_level 1
  end

end
