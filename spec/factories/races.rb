FactoryGirl.define do
  factory :race do
  end

  factory :dragonborn, parent: :race do
    name "Dragonborn"
    description "Proud, honorable warriors, born from the blood of an ancient dragon god"
    size "medium"
    vision "normal"
    speed 6
  end

  factory :dwarf, parent: :race do
    name "Dwarf"
    description "Masters of stone and iron, dauntless and unyielding in the face of adversity"
    size "medium"
    vision "Low light"
    speed 5
  end
end
