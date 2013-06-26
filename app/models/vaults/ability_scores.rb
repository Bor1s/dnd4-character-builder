module Vaults::AbilityScores
  def self.included(base)
    base.class_exec do
      field :strength, type: Integer, default: 8
      field :dexterity, type: Integer, default: 10
      field :constitution, type: Integer, default: 10
      field :charisma, type: Integer, default: 10
      field :intelligence, type: Integer, default: 10
      field :wisdom, type: Integer, default: 10
    end

    base.class_eval do
      def strength_modifier
        AbilityScoreGenerator.modifier_of(strength)
      end

      def dexterity_modifier
        AbilityScoreGenerator.modifier_of(dexterity)
      end

      def constitution_modifier
        AbilityScoreGenerator.modifier_of(constitution)
      end

      def constitution_increased?
        constitution_changed? && constitution > (constitution_was || 0) #For pure character
      end

      def constitution_increased_to_even?
        constitution_increased? && constitution.even?
      end

      def charisma_modifier
        AbilityScoreGenerator.modifier_of(charisma)
      end

      def intelligence_modifier
        AbilityScoreGenerator.modifier_of(intelligence)
      end

      def wisdom_modifier
        AbilityScoreGenerator.modifier_of(wisdom)
      end

      def level_multiplier
        level == 1 ? 0 : level
      end
    end
  end
end
