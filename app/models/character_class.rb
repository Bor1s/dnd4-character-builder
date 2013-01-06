class CharacterClass < ActiveRecord::Base
	attr_accessor :healing_surge_value

  module Extensions
    def cleric?
      character_class.name == "cleric"
    end
  end
end
