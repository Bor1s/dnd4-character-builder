shared_context "healing surges" do
  it 'should calculate correct healing surges' do
    FactoryGirl.create(:healing_surges_rule)
    subject.character.constitution = 14
    subject.process
    
    subject.character.healing_surges.should eq 7+AbilityScoreGenerator.modifier_of(subject.character.constitution)
  end
end
