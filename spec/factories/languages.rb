# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :language do

    factory :common_language do
      name 'Common'
      spoken_by { ["Humans", "Halflings", "Tieflings"] }
      script "Common"
    end

    factory :draconic_language do
      name 'Draconic'
      spoken_by { ["Dragons", "Dragonborn", "Kobolds"] }
      script "Lokharic"
    end
  
  end
end
