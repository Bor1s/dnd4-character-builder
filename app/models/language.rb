class Language < ActiveRecord::Base
  attr_accessible :name, :script, :spoken_by
  serialize :spoken_by, Array

  has_and_belongs_to_many :characters
end
