class Skill
  include Mongoid::Document
  embedded_in :character

  field :name, type: String
  field :value, type: Integer, default: 0
  field :trained, type: Boolean, default: false
  field :keyword, type: String

end
