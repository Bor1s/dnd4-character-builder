# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :skill do
  end

  factory :history, parent: :skill do
    name "history"
  end

  factory :intimidate, parent: :skill do
  	name "intimidate"
  end
end
