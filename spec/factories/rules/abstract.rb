FactoryGirl.define do
  factory :simple_rule, parent: :rule do
    name :simple_rule
    todo Hash[
      what: "1"
    ]
  end

  factory :simple_rule_with_condition_rule, parent: :rule do
    name :simple_rule_with_condition_rule
    todo Hash[
      what: "1",
      if: "1 == 1"
    ]
  end
  
  factory :simple_rule_with_bad_condition_rule, parent: :rule do
    name :simple_rule_with_bad_condition_rule
    todo Hash[
      what: "1",
      if: "2 == 1"
    ]
  end
  
  factory :incomplete_rule, parent: :rule do
    name :incomplete_rule
    todo Hash[
      what: "{some_unexisting_rule} + 1"
    ]
  end

  factory :with_store_rule, parent: :rule do
    name :with_store_rule
    todo Hash[
      what: "1 + 1",
      store_as: :foobar
    ]
  end

  factory :test_character_expirience_rule, parent: :rule do
    name :test_character_expirience_rule
    todo Hash[
      what: "{expirience} + 2",
      store_as: :expirience,
      if: "{level} == 1"
    ]
    root true
  end
end
