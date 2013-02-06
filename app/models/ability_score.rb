class AbilityScore < ActiveRecord::Base
  #TODO make ability scores a simple store
	module Extensions
		def strength
      @_strength ||= ability_scores.where(name: "strength").first
	    @_strength.value
	  end

	  def strength=(value)
	    @_strength.value = value
	  end

	  def strength_modifier
	    AbilityScoreGenerator.modifier_of(strength)
	  end

	  def dexterity
	    @_dexterity ||= ability_scores.where(name: "strength").first
	    @_dexterity.value
	  end 

	  def dexterity_modifier
	    AbilityScoreGenerator.modifier_of(dexterity)
	  end

	  def charisma
	    @_charisma ||= ability_scores.where(name: "charisma").first
	    @_charisma.value
	  end 

	  def charisma=(value)
	    @_charisma.value = value
	  end

	  def charisma_modifier
	    AbilityScoreGenerator.modifier_of(charisma)
	  end

	  def wisdom
	    @_wisdom ||= ability_scores.where(name: "wisdom").first
	    @_wisdom.value
	  end 

	  def wisdom_modifier
	    AbilityScoreGenerator.modifier_of(wisdom)
	  end

	  def intelligence
	    @_intelligence ||= ability_scores.where(name: "intelligence").first
	    @_intelligence.value
	  end 

	  def intelligence_modifier
	    AbilityScoreGenerator.modifier_of(intelligence)
	  end

	  def constitution
	    @_constitution ||= ability_scores.where(name: "constitution").first
	    @_constitution.value
	  end

	  def constitution=(value)
	    @_constitution.value = value
      @consitution_increased = true
	  end

    def constitution_increased?
      @consitution_increased 
    end

    def constitution_increased_to_even?
      constitution_increased? && constitution.even?
    end

	  def constitution_modifier
	    AbilityScoreGenerator.modifier_of(constitution)
	  end
	end

  attr_accessible :name, :value

  belongs_to :character
end
