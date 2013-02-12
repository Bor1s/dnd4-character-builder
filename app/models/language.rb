class Language
  include Mongoid::Document

  field :name, type: String
  field :script, type: String
  field :spoken_by, type: Array
end
