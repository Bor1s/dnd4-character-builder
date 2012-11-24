class Rule #< ActiveRecord::Base
  attr_accessor :name, :formula
  #scope :hit_points, ->() { where(name: "hit_points") }
end
