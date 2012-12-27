FactoryGirl.define do
  factory :test_character_expirience_rule, parent: :rule do
    name :test_character_expirience_rule
    todo [
      {
        what: "{expirience} + 2",
        store_as: :expirience,
        if: "{level} == 1"
      }
    ]
  end
end
