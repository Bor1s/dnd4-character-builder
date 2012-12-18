shared_context "healing surges" do
  it 'should calculate correct healing surges' do
    FactoryGirl.create(:healing_surges_rule)
    subject.character.constitution = 14
    subject.process
    
    subject.character.healing_surges.should eq 7+AbilityScoreGenerator.modifier_of(subject.character.constitution)
  end

  it 'should calculate correct healing surge value' do
    FactoryGirl.create(:hit_points_rule)
    FactoryGirl.create(:hit_points_by_level_rule)
    FactoryGirl.create(:start_hit_points_rule)
    FactoryGirl.create(:healing_surge_value_rule)
    subject.character.constitution = 14
    subject.process

    subject.character.healing_surge_value.should eq subject.character.hit_points / 4
  end

  it 'should calculate correct bloodied value' do
    FactoryGirl.create(:hit_points_rule)
    FactoryGirl.create(:hit_points_by_level_rule)
    FactoryGirl.create(:start_hit_points_rule)
    FactoryGirl.create(:bloodied_rule)

    subject.character.constitution = 14
    subject.process

    subject.character.bloodied.should eq subject.character.hit_points / 2
  end
end
