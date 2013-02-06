shared_context "ability scores" do

  subject do
    FactoryGirl.build(:character)
  end

  it 'has ability scores' do
    subject.should respond_to :ability_scores
  end

  specify { subject.should respond_to :strength }
  specify { subject.should respond_to :wisdom }
  specify { subject.should respond_to :charisma }
  specify { subject.should respond_to :intelligence }
  specify { subject.should respond_to :dexterity }
  specify { subject.should respond_to :constitution }

  it "should have appropriate ability scores modifiers" do
    pending "Rework"

    as = AbilityScoreGenerator.standard_array
    as.each do |s|
      subject.strength = as.pop
    end

    subject.strength_modifier.should eq AbilityScoreGenerator.modifier_of(subject.strength)
    subject.dexterity_modifier.should eq AbilityScoreGenerator.modifier_of(subject.dexterity)
    subject.intelligence_modifier.should eq AbilityScoreGenerator.modifier_of(subject.intelligence)
    subject.wisdom_modifier.should eq AbilityScoreGenerator.modifier_of(subject.wisdom)
    subject.charisma_modifier.should eq AbilityScoreGenerator.modifier_of(subject.charisma)
    subject.constitution_modifier.should eq AbilityScoreGenerator.modifier_of(subject.constitution)
  end
  
end
