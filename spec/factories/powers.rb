# --- Character powers: at_will, encounter, daily (utilities and attacks)

FactoryGirl.define do
  factory :power do
    power_type :symbol #[:utility, :attack]
    name ""
    description ""
    keywords []
    damage_type ""
    effect_type ""
    accessories []
    action_type ""
    trigger ""
    attack_type ""
    range ""
    targets ""
    attack Hash.new({ ability: "lambda", vs: "" })
    hit "lambda"
    miss ""
    effect ""
    sustain ""
    special ""
  end

  factory :at_will, parent: :power do
  end

  factory :encounter, parent: :power do
  end

  factory :daily, parent: :power do
  end

  factory :dragon_breath, parent: :encounter do
    power_type :attack
    name "Dragon Breath"
    description "As you open your mouth with a roar, the deadly power of your draconic kin blasts forth to engulf your foes."
    keywords ['Acid', "Cold", 'Fire', 'Lightning', 'Poison']
    damage_type "acid, cold, fire, lightning, or poison"
    effect_type ""
    accessories []
    action_type 'minor'
    trigger ""
    attack_type "close"
    range "blast 3"
    targets "All creatures in area"
    attack Hash.new({ 
      ability: "()->{ [character.ability_scores.strength_modifier,
        character.ability_scores.constitution_modifier,
        character.ability_scores.dexterity_modifier].max + 2 }",
      vs: "Reflex"
    })
    hit "()->{
      case level
        when 11
          DiceRoller.2d6 + 4 + (level / 2) + ability_scores.constitution_modifier
        when 21
          DiceRoller.3d6 + 6 + (level / 2) + ability_scores.constitution_modifier
      end
     }"
    miss ""
    effect ""
    sustain ""
    special "When you create your character, choose Strength, Constitution, or Dexterity as the ability score you use when making attack rolls with this power. You also choose the power's damage type: acid, cold, fire, lightning, or poison. These two choices remain throughout your character's life and do not change the power's other effects."
  end

end
