FactoryGirl.define do
  factory :simple_rule, parent: :rule do
    name :simple_rule
    todo [
      what: "1"
    ]
  end

  factory :simple_rule_with_condition, parent: :rule do
    name :simple_rule_with_condition
    todo [
      { 
        what: "1",
        if: "1 == 1"
      }
    ]
  end
  
  factory :simple_rule_with_bad_condition, parent: :rule do
    name :simple_rule_with_bad_condition
    todo [
      { 
        what: "1",
        if: "2 == 1"
      }
    ]
  end
  
  factory :incomplete_rule, parent: :rule do
    name :incomplete_rule
    todo [
      { 
        what: "{some_unexisting_rule} + 1"
      }
    ]
  end

  factory :with_store_rule, parent: :rule do
    name :incomplete_rule
    todo [
      { 
        what: "1 + 1",
        store_as: :foobar
      }
    ]
  end

  factory :muliple_result_rule, parent: :rule do
    name :muliple_result_rule
    todo [
      {
        what: "0 + 1"
      },
      {
        what: "1 + 1"
      }
    ]
  end

  factory :test_character_expirience_rule, parent: :rule do
    name :test_character_expirience_rule
    todo [
      {
        what: "{expirience} + 2",
        store_as: :expirience,
        if: "{level} == 1"
      }
    ]
    root true
  end
end
