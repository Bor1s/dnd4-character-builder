class Power
  include Mongoid::Document

  field :name, type: String
  field :power_type, type: String
  field :description, type: String
  field :keywords, type: Array
  #field :damage_type, type: String
  #field :effect_type, type: String
  field :accessories, type: Array
  field :action_type, type: String
  field :attack_type_and_range, type: String
  field :power_target, type: String
  field :attack, type: String
  field :miss, type: String
  field :secondary_target_and_attack, type: String
  field :sustain, type: String

  #String to be interpolated into, ex.
  # 3d6: "{dice_amount}d{dice_side} + {charisma_modifier} and you push enemy ..."
  field :hit, type: String
  field :effect, type: String

  field :used, type: Boolean
end
