require 'spec_helper'

describe RuleProcessor do
	subject do
		character = FactoryGirl.create(:character, level: 1)
		RuleProcessor.new(character)
 	end

  specify { subject.should respond_to :character }
  specify { subject.should respond_to :command }

end
