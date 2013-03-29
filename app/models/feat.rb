class Feat
  include Mongoid::Document
  embedded_in :character

  field :name, type: String
  field :prerequisites, type: String
  field :benefit, type: String
  field :available, type: Boolean, default: false
  field :used, type: Boolean, default: false
end
