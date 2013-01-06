FactoryGirl.define do
  factory :utilities_known_at_second_level_rule, parent: :rule do
    name :utilities_known_at_second_level_rule
    todo Hash[
      what: "1", 
      store_as: :utility_powers_known,
      if: "{level} == 2"
    ]
    root true
  end

  factory :feats_known_at_second_level_rule, parent: :rule do
    name :feats_known_at_second_level_rule
    todo Hash[
      what: "{feats_known} + 1", 
      store_as: :feats_known,
      if: "{level} == 2"
    ]
    root true
  end

end
