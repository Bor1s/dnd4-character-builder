class Skill < ActiveRecord::Base
	module Extensions
		def history
	    @_history ||= character_skills.joins(:skill).where("skills.name = 'history'").first
	    @_history.value
	  end

	  def history=(value)
	    @_history.value += value
	  end

	  def history_trained?
	    @_history.trained?
	  end

	  def intimidate
	    @_intimidate ||= character_skills.joins(:skill).where("skills.name = 'intimidate'").first
	    @_intimidate.value
	  end

	  def intimidate=(value)
	    @_intimidate.value += value
	  end

	  def intimidate_trained?
	    @_intimidate.trained?
	  end
	end

  attr_accessible :name

  attr_accessor :trained

  has_many :character_skills
  has_many :characters, through: :character_skills

  before_save :set_trained

  def set_trained
  	character_skills.last.trained = self.trained #Last is the current object in memory
  end
end
