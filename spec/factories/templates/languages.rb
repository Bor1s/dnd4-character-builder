FactoryGirl.define do
  factory :language_template, class: Templates::Language do

    factory :common_language_template, parent: :language_template do
      name 'Common'
      spoken_by { ["Humans", "Halflings", "Tieflings"] }
      script "Common"
    end

    factory :draconic_language_template, parent: :language_template do
      name 'Draconic'
      spoken_by { ["Dragons", "Dragonborn", "Kobolds"] }
      script "Lokharic"
    end
  
  end
end
