shared_context "hit points, healing surges and bloodied value" do
  
  context "foobar" do
    before :each do
      ability_scores = AbilityScoreGenerator.standard_array
      subject.ability_scores.each do |s|
        s.update_attributes(value: ability_scores.shift)
      end
      FactoryGirl.create(:hit_points_at_first_level_rule)
      FactoryGirl.create(:general_hit_points_rule)
      FactoryGirl.create(:healing_surges_rule)
      FactoryGirl.create(:healing_surge_value_rule)
      FactoryGirl.create(:bloodied_rule)

      RuleProcessor.new(subject).process
    end

    it 'should calculate correct hit points' do
      subject.hit_points.should eq(subject.hit_points_at_first_level + subject.constitution)
    end

    it 'should calculate correct healing surges' do
      subject.healing_surges.should eq subject.healing_surges_per_day+AbilityScoreGenerator.modifier_of(subject.constitution)
    end

    it 'should calculate correct healing surge value' do
      subject.healing_surge_value.should eq(subject.hit_points / 4)
    end

    it 'should calculate correct bloodied value' do
      subject.bloodied.should eq(subject.hit_points / 2)
    end

  end
end
