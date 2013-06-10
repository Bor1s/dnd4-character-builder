FactoryGirl.define do
  factory :strength_rule, parent: :rule do
    name :strength_rule
    todo Hash[
      what: "2",
      if: "{dragonborn?}",
      store_as: :strength,
    ]
    stage 2
  end

  factory :charisma_rule, parent: :rule do
    name :charisma_rule
    todo Hash[
      what: "2",
      if: "{dragonborn?}",
      store_as: :charisma
    ]
    stage 2
  end

  factory :history_rule, parent: :rule do
    name :history_rule
    todo Hash[
      what: "2",
      if: "{dragonborn?}",
      store_as: :history
    ]
    stage 2
  end

  factory :intimidate_rule, parent: :rule do
    name :intimidate_rule
    todo Hash[
      what: "2",
      if: "{dragonborn?}",
      store_as: :intimidate
    ]
    stage 2
  end

  factory :draconic_heritage_rule, parent: :rule do
    name :draconic_heritage_rule
    todo Hash[
      what: "{constitution_modifier}",
      if: "{dragonborn?}",
      store_as: :healing_surge_value
    ]
    stage 2
  end
  
  factory :dragon_breath_rule, parent: :rule do
    name :dragon_breath_rule
    todo Hash[
      what: "1",
      if: "{dragonborn?}",
      store_as: :encounter_powers_known
    ]
    stage 2
  end

end
