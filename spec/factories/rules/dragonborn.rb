FactoryGirl.define do
  # NOTE rename rules and add store_to
  factory :strength_rule, parent: :rule do
    name :strength_rule
    performs Hash[
      what: [:strength, 2],
      how: :+
    ]
    as_soon_as [
      race: { is: "dragonborn" }
    ]
    root true
  end

  factory :charisma_rule, parent: :rule do
    name :charisma_rule
    performs Hash[
      what: [:charisma, 2],
      how: :+
    ]
    as_soon_as [
      race: { is: "dragonborn" }
    ]
    root true
  end

  factory :trained_history_rule, parent: :rule do
    name :trained_history_rule
    performs Hash[
      what: [:history, 5],
      how: :+
    ]
    as_soon_as [
      history_trained?: { is: true }
    ]
  end

  factory :history_rule, parent: :rule do
    name :history_rule
    performs Hash[
      what: [:history, 2, :trained_history_rule],
      how: :+
    ]
    as_soon_as [
      race: { is: "dragonborn" }
    ]
    root true
  end

  factory :trained_intimidate_rule, parent: :rule do
    name :trained_intimidate_rule
    performs Hash[
      what: [:intimidate, 5],
      how: :+
    ]
    as_soon_as [
      intimidate_trained?: { is: true }
    ]
  end

  factory :intimidate_rule, parent: :rule do
    name :intimidate_rule
    performs Hash[
      what: [:intimidate, 2, :trained_intimidate_rule],
      how: :+
    ]
    as_soon_as [
      race: { is: "dragonborn" }
    ]
    root true
  end

  factory :draconic_heritage_rule, parent: :rule do
    name :draconic_heritage_rule
    store_to :healing_surge_value
    performs Hash[
      what: [:healing_surge_value, :constitution_modifier],
      how: :+
    ]
    as_soon_as [
      race: { is: "dragonborn" }
    ]
    root true
  end
  
  factory :dragon_breath_rule, parent: :rule do
    name :dragon_breath_rule
    store_to :encounter_powers_known
    performs Hash[
      what: [:encounter_powers_known, 1],
      how: :+
    ]
    as_soon_as [
      race: { is: "dragonborn" }
    ]
    root true
  end

end
