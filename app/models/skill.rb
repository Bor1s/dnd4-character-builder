class Skill
  include Mongoid::Document
  embedded_in :character

  field :name, type: String
end
