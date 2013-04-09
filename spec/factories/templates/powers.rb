# --- Character powers: at_will, encounter, daily (utilities and attacks)

FactoryGirl.define do
  factory :power, class: Templates::Power do
    used false

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
  end

  factory :turn_undead_power, parent: :encounter do
    name :turn_undead
    description "You sear undead foes, push them back, and root them in place"
    keywords [:divine, :implement, :radiant]
    action_type :standard_action
    attack_type_and_range "close burst {turn_undead_burst_squares} (2 at 1st, 5 at 11th level, 8 at 21st level)"
    power_target "Each undead creature in burst"
    attack "Wisdom vs. Will"
    hit "{turn_undead_dice_amount}d{turn_undead_dice_side} + {wisdom_modifier} radiant damage, and you push the target a number of squares equal to 3 + your {charisma_modifier}. The target is immobilized until the end of your next turn."
    #TODO implement rules for:
    # 1. attack_type_and_range
    # 2. Increase damage to 2d10 + Wisdom modifier at 5th level, 3d10 + Wisdom modifier at 11th level, 4d10 + Wisdom modifier at 15th level, 5d10 + Wisdom modifier at 21st level, and 6d10 + Wisdom modifier at 25th level
    miss "Half damage, and the target is not pushed or immobilized."
    used true
  end

  factory :healing_word_power, parent: :encounter do
    name :healing_word
    description "You whisper a brief prayer as divine light washes over your target, helping to mend its wounds"
    keywords [:divine, :healing]
    action_type :minor_action
    attack_type_and_range "close burst {healing_word_burst_squares} (10 at 11th level, 15 at 21st level)"
    power_target "You or one ally"
    effect "The target can spend a healing surge and regain an additional 1d6 + {healing_keyword_bonus} hit points"
    #TODO implement rules for:
    # 1. attack_type_and_range
    # 2. Add healing_keyword_bonus to effect 1d6
    # Increase the amount of additional hit points regained to 2d6 at 6th level, 3d6 at 11th level, 4d6 at 16th level, 5d6 at 21st level, and 6d6 at 26th level.
    used true
  end

  #factory :dragon_breath, parent: :encounter do
    #power_type :attack
    #name "Dragon Breath"
    #description "As you open your mouth with a roar, the deadly power of your draconic kin blasts forth to engulf your foes."
    #keywords ['Acid', "Cold", 'Fire', 'Lightning', 'Poison']
    #damage_type "acid, cold, fire, lightning, or poison"
    #effect_type ""
    #accessories []
    #action_type 'minor'
    #trigger ""
    #attack_type "close"
    #range "blast 3"
    #targets "All creatures in area"
    #attack Hash.new({ 
      #ability: "()->{ [character.ability_scores.strength_modifier,
        #character.ability_scores.constitution_modifier,
        #character.ability_scores.dexterity_modifier].max + 2 }",
      #vs: "Reflex"
    #})
    #hit "()->{
      #case level
        #when 11
          #DiceRoller.2d6 + 4 + (level / 2) + ability_scores.constitution_modifier
        #when 21
          #DiceRoller.3d6 + 6 + (level / 2) + ability_scores.constitution_modifier
      #end
     #}"
    #miss ""
    #effect ""
    #sustain ""
    #special "When you create your character, choose Strength, Constitution, or Dexterity as the ability score you use when making attack rolls with this power. You also choose the power's damage type: acid, cold, fire, lightning, or poison. These two choices remain throughout your character's life and do not change the power's other effects."
  #end

end
