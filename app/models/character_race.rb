class CharacterRace
  include Mongoid::Document

  embedded_in :character

  field :size, type: String
  field :vision, type: String
  field :speed, type: Integer
  field :name, type: String
  field :description, type: String

  module Extensions
    def vision
      character_race.vision
    end

    def race
      character_race.name.downcase
    end

    def speed
      character_race.speed
    end

    def size
      character_race.size
    end

    def dragonborn?
      race == 'dragonborn'
    end

    def set_dragonborn_languages
      common = Language.where(name: "Common")
      draconic = Language.where(name: "Draconic")
      languages << [common, draconic] and false #NOTE need to explicitly return simple result for eval
    end
  end
end
