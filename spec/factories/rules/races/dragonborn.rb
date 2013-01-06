FactoryGirl.define do
  factory :strength_rule, parent: :rule do
    name :strength_rule
    todo Hash[
      what: "{strength} + 2",
      if: "{dragonborn?} and {level} == 1",
      store_as: :strength
    ]

    root true
  end

  factory :charisma_rule, parent: :rule do
    name :charisma_rule
    todo Hash[
      what: "{charisma} + 2",
      if: "{dragonborn?} and {level} == 1",
      store_as: :charisma
    ]

    root true
  end

  factory :history_rule, parent: :rule do
    name :history_rule
    todo Hash[
      what: "{history} + 2",
      if: "{dragonborn?} and {level} == 1",
      store_as: :history
    ]

    root true
  end

  factory :intimidate_rule, parent: :rule do
    name :intimidate_rule
    todo Hash[
      what: "{intimidate} + 2",
      if: "{dragonborn?} and {level} == 1",
      store_as: :intimidate
    ]

    root true
  end

  factory :draconic_heritage_rule, parent: :rule do
    name :draconic_heritage_rule
    todo Hash[
      what: "{healing_surge_value} + {constitution_modifier}",
      if: "{dragonborn?}",
      store_as: :healing_surge_value
    ]

    root true
  end
  
  factory :dragon_breath_rule, parent: :rule do
    name :dragon_breath_rule
    todo Hash[
      what: "{encounter_powers_known} + 1",
      if: "{dragonborn?} and {level} == 1",
      store_as: :encounter_powers_known
    ]

    root true
  end

  factory :dragonborn_languages_rule, parent: :rule do
    name :dragonborn_languages_rule
    todo Hash[
      what: "{set_dragonborn_languages}",
      if: "{dragonborn?} and {level} == 1"
    ]

    root true
  end
  
end
