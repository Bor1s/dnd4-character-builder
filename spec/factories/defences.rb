# TODO PH 17
# --- Character defences: AC, Will, Ref, Fort ---

FactoryGirl.define do
  factory :defence do
  end

  factory :armor_class, parent: :defence do
    name "Armor class"
    short_name "AC"
  end

  factory :fortitude, parent: :defence do
    name "Fortitude"
    short_name "Fort"
  end

  factory :reflex, parent: :defence do
    name "Reflex"
    short_name "Ref"
  end

  factory :will, parent: :defence do
    name "Will"
    short_name "Will"
  end
end
