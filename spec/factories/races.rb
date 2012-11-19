# --- Character races

FactoryGirl.define do
  factory :character_race do
    powers []
  end

  factory :dragonborn, parent: :character_race do
    name "Dragonborn"
    description "Proud, honorable warriors, born from the blood of an ancient dragon god"
  end

  factory :dwarf, parent: :character_race do 
    name "Dwarf"
    description "Masters of stone and iron, dauntless and unyielding in the face of adversity"
  end
end
