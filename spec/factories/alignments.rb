FactoryGirl.define do
  factory :alignment do
    description "A character's alignment (or lack thereof) describes his or her moral stance."
  end

  factory :good_alignment, parent: :alignment do
    name "Good"
    description "Good: Freedom and kindness."
  end

  factory :lawful_good_alignment, parent: :alignment do
    name "Lawful Good"
    description "Lawful Good: Civilization and order."
  end

  factory :evil_alignment, parent: :alignment do
    name "Evil"
    description "Evil: Tyranny and hatred."
  end

  factory :chaotic_evil_alignment, parent: :alignment do
    name "Chaotic Evil"
    description "Chaotic Evil: Entropy and destruction."
  end

  factory :unaligned, parent: :alignment do
    name "Unaligned"
    description "Unaligned: Having no alignment; not taking a stand."
  end
end
