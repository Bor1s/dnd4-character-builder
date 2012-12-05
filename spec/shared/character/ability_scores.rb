shared_context "ability scores" do
  it 'has ability scores' do
    subject.should respond_to :ability_scores
  end

  specify { subject.should respond_to :strength }
  specify { subject.should respond_to :wisdom }
  specify { subject.should respond_to :charisma }
  specify { subject.should respond_to :intelligence }
  specify { subject.should respond_to :dexterity }
  specify { subject.should respond_to :constitution }

  specify { subject.strength_modifier.should eq AbilityScoreGenerator.send(:modifier_of, subject.strength) }
  specify { subject.dexterity_modifier.should eq AbilityScoreGenerator.send(:modifier_of, subject.dexterity) }
  specify { subject.intelligence_modifier.should eq AbilityScoreGenerator.send(:modifier_of, subject.intelligence) }
  specify { subject.wisdom_modifier.should eq AbilityScoreGenerator.send(:modifier_of, subject.wisdom) }
  specify { subject.charisma_modifier.should eq AbilityScoreGenerator.send(:modifier_of, subject.charisma) }
  specify { subject.constitution_modifier.should eq AbilityScoreGenerator.send(:modifier_of, subject.constitution) }
end
