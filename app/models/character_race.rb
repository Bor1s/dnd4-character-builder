class CharacterRace
  include Mongoid::Document

  embedded_in :character

  field :size, type: String
  field :vision, type: String
  field :speed, type: Integer
  field :name, type: String
  field :description, type: String
end
