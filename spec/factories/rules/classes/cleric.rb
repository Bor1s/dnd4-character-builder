FactoryGirl.define do
  factory :cleric_encounter_powers_known_rule, parent: :rule do
    name :cleric_encounter_powers_known_rule
    todo Hash[
      what: "{encounter_powers_known} + 3",
      if: "{cleric?}",
      store_as: :encounter_powers_known
    ]

    root true
  end
end
