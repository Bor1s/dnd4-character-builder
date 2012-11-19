require 'spec_helper'

describe AbilityScoreModifier do
  subject { AbilityScoreModifier }
  specify { subject.modifier_of(20).should eq(5) }
  specify { subject.modifier_of(21).should eq(5) }
  specify { subject.modifier_of(22).should eq(6) }
  specify { subject.modifier_of(23).should eq(6) }
  specify { subject.modifier_of(24).should eq(7) }
  specify { subject.modifier_of(25).should eq(7) }
  
  specify { subject.modifier_of(1).should eq(-5) }
  
  specify do
    lambda { subject.modifier_of(-1) }.should raise_exception 
  end
end
