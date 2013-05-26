FactoryGirl.define do
  factory :utilities_known_at_twfirst_level_rule, parent: :rule do
    name :utilities_known_at_twfirst_level_rule
    todo Hash[
      what: "5",
      store_as: :utility_powers_known,
      if: "{level} == 21"
    ]
    one_off true
  end

  factory :feats_known_at_twfirst_level_rule, parent: :rule do
    name :feats_known_at_twfirst_level_rule
    todo Hash[
      what: "13",
      store_as: :feats_known,
      if: "{level} == 21"
    ]
    one_off true
  end

  factory :atwills_known_at_twfirst_level_rule, parent: :rule do
    name :atwills_known_at_twfirst_level_rule
    todo Hash[
      what: "2",
      store_as: :atwill_powers_known,
      if: "{level} == 21"
    ]
    one_off true
  end
  
  factory :encounters_known_at_twfirst_level_rule, parent: :rule do
    name :encounters_known_at_twfirst_level_rule
    todo Hash[
      what: "{cleric_encounter_powers_known_rule} + {dragon_breath_rule} + 4",
      store_as: :encounter_powers_known,
      if: "{level} == 21"
    ]
    one_off true
  end
  
  factory :dailies_known_at_twfirst_level_rule, parent: :rule do
    name :dailies_known_at_twfirst_level_rule
    todo Hash[
      what: "4",
      store_as: :daily_powers_known,
      if: "{level} == 21"
    ]
    one_off true
  end

  factory :strength_increasing_twfirst_level_rule, parent: :rule do
    name :strength_increasing_twfirst_level_rule
    todo Hash[
      what: "{strength} + 1",
      store_as: :strength,
      if: "{level} == 21"
    ]
    one_off true
  end

  factory :dexterity_increasing_twfirst_level_rule, parent: :rule do
    name :dexterity_increasing_twfirst_level_rule
    todo Hash[
      what: "{dexterity} + 1",
      store_as: :dexterity,
      if: "{level} == 21"
    ]
    one_off true
  end

  factory :charisma_increasing_twfirst_level_rule, parent: :rule do
    name :charisma_increasing_twfirst_level_rule
    todo Hash[
      what: "{charisma} + 1",
      store_as: :charisma,
      if: "{level} == 21"
    ]
    one_off true
  end

  factory :constitution_increasing_twfirst_level_rule, parent: :rule do
    name :constitution_increasing_twfirst_level_rule
    todo Hash[
      what: "{constitution} + 1",
      store_as: :constitution,
      if: "{level} == 21"
    ]
    one_off true
  end

  factory :wisdom_increasing_twfirst_level_rule, parent: :rule do
    name :wisdom_increasing_twfirst_level_rule
    todo Hash[
      what: "{wisdom} + 1",
      store_as: :wisdom,
      if: "{level} == 21"
    ]
    one_off true
  end

  factory :intelligence_increasing_twfirst_level_rule, parent: :rule do
    name :intelligence_increasing_twfirst_level_rule
    todo Hash[
      what: "{intelligence} + 1",
      store_as: :intelligence,
      if: "{level} == 21"
    ]
    one_off true
  end

end
