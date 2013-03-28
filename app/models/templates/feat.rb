class Templates::Feat
  include Mongoid::Document

  field :name, type: String
  field :prerequisites, type: String
  field :benefit, type: String
end
