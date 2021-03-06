class Race
  include Mongoid::Document

  has_many :characters

  field :size, type: String
  field :vision, type: String
  field :speed, type: Integer
  field :name, type: String
  field :description, type: String
end
