FactoryGirl.define do
  factory :simple_rule_abstract, parent: :rule do
    name :simple_rule_abstract
    todo Hash[
      what: "1"
    ]
  end

  factory :simple_rule_with_condition_rule_abstract, parent: :rule do
    name :simple_rule_with_condition_rule_abstract
    todo Hash[
      what: "1",
      if: "1 == 1"
    ]
  end
  
  factory :simple_rule_with_bad_condition_rule_abstract, parent: :rule do
    name :simple_rule_with_bad_condition_rule_abstract
    todo Hash[
      what: "1",
      if: "2 == 1"
    ]
  end
  
  factory :test_character_expirience_rule_abstract, parent: :rule do
    name :test_character_expirience_rule_abstract
    todo Hash[
      what: "{expirience} + 2",
      store_as: :expirience,
      if: "{level} == 1"
    ]
  end

  factory :faulty_rule, parent: :rule do
    name :faulty_rule
    todo Hash[
      what: "nil + 2"
    ]
  end
end
