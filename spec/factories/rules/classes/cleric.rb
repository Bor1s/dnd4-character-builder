FactoryGirl.define do
  factory :cleric_encounter_powers_known, parent: :rule do
    name :cleric_encounter_powers_known
    todo Hash[
      what: "{encounter_powers_known} + 3",
      if: "{cleric?} and {level} == 1",
      store_as: :encounter_powers_known
    ]

    root true
  end
end
