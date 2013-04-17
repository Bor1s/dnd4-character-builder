class Templates::Power
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

  field :used, type: Boolean, default: false #need to show currently used powers on UI
  field :available, type: Boolean, default: false #need to show all available powers for current character on UI
  field :available_from_level, type: Integer # Need to use in 'decider' which will diced what powers are available to user

  module Extensions
    def self.included(base)
      base.extend(Extensions::ClassMethods)
    end

    module ClassMethods
      def power_names
        Templates::Power.all.map(&:name)
      end
    end
  end

end
