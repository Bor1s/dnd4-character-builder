class Templates::Skill
  include Mongoid::Document

  field :name, type: String
  field :description, type: String
  field :keyword, type: String
end
