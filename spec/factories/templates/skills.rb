FactoryGirl.define do
  factory :skill_template, class: Templates::Skill do
    #TODO add description

    factory :acrobatics_template do
      name "Acrobatics"
      keyword :acrobatics
    end

    factory :arcana_template do
      name "Arcana"
      keyword :arcana
    end

    factory :athletics_template do
      name "Athletics"
      keyword :athletics
    end

    factory :bluff_template do
      name "Bluff"
      keyword :bluff
    end

    factory :diplomacy_template do
      name "Diplomacy"
      keyword :diplomacy
    end

    factory :dungeoneering_template do
      name "Dunfeoneering"
      keyword :dungeoneering
    end

    factory :endurance_template do
      name "Endurance"
      keyword :endurance
    end

    factory :heal_template do
      name "Heal"
      keyword :heal
    end

    factory :history_template do
      name "History"
      keyword :history
    end

    factory :insight_template do
      name "Insight"
      keyword :insight
    end

    factory :intimidate_template do
      name "Intimidate"
      keyword :intimidate
    end

    factory :nature_template do
      name "Nature"
      keyword :nature
    end

    factory :perception_template do
      name "Perception"
      keyword :perception
    end

    factory :religion_template do
      name "Religion"
      keyword :religion
    end

    factory :stealth_template do
      name "Stealth"
      keyword :stealth
    end

    factory :streetwise_template do
      name "Streetwise"
      keyword :streetwise
    end

    factory :thievery_template do
      name "Thievery"
      keyword :thievery
    end
  end
end
