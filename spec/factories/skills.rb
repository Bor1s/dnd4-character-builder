FactoryGirl.define do
  factory :skill do
    #TODO add description

    factory :acrobatics do
      name "Acrobatics"
      keyword :acrobatics
    end

    factory :arcana do
      name "Arcana"
      keyword :arcana
    end

    factory :athletics do
      name "Athletics"
      keyword :athletics
    end

    factory :bluff do
      name "Bluff"
      keyword :bluff
    end

    factory :diplomacy do
      name "Diplomacy"
      keyword :diplomacy
    end

    factory :dungeoneering do
      name "Dunfeoneering"
      keyword :dungeoneering
    end

    factory :endurance do
      name "Endurance"
      keyword :endurance
    end

    factory :heal do
      name "Heal"
      keyword :heal
    end

    factory :history do
      name "History"
      keyword :history
      value 0
    end

    factory :insight do
      name "Insight"
      keyword :insight
    end

    factory :intimidate do
      name "Intimidate"
      keyword :intimidate
      value 0
    end

    factory :nature do
      name "Nature"
      keyword :nature
    end

    factory :perception do
      name "Perception"
      keyword :perception
    end

    factory :religion do
      name "Religion"
      keyword :religion
    end

    factory :stealth do
      name "Stealth"
      keyword :stealth
    end

    factory :streetwise do
      name "Streetwise"
      keyword :streetwise
    end

    factory :thievery do
      name "Thievery"
      keyword :thievery
    end
  end
end
