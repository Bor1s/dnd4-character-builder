FactoryGirl.define do
  factory :race, class: Templates::Race do
  end

  factory :dragonborn_template, parent: :race do
    name "Dragonborn"
    description "Proud, honorable warriors, born from the blood of an ancient dragon god"
    size "medium"
    vision "normal"
    speed 6
  end
end
