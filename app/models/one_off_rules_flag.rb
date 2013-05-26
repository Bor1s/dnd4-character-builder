class OneOffRulesFlag
  include Mongoid::Document

  belongs_to :character

  field :character_id
  field :rule_id
  field :level, type: Integer
end
