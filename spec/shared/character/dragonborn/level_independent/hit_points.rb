shared_context "hit points, healing surges and bloodied value" do
  
  context "calculation of" do
    before :each do
      ability_scores = AbilityScoreGenerator.standard_array
      subject.ability_scores.each do |s|
        s.update_attributes(value: ability_scores.shift)
      end
      FactoryGirl.create(:hit_points_increasing_rule)
      FactoryGirl.create(:hit_points_rule)
      FactoryGirl.create(:healing_surges_rule)
      FactoryGirl.create(:healing_surge_value_rule)
      FactoryGirl.create(:bloodied_rule)

      RuleProcessor.new(subject).process
    end

    it 'hit points should be corect' do
      subject.hit_points.should eq(subject.hit_points_at_first_level + subject.constitution)
    end

    it 'healing surges should be correct' do
      subject.healing_surges.should eq subject.healing_surges_per_day+AbilityScoreGenerator.modifier_of(subject.constitution)
    end

    it 'healing surge value should be correct' do
      subject.healing_surge_value.should eq(subject.hit_points / 4)
    end

    it 'bloodied value should be correct' do
      subject.bloodied.should eq(subject.hit_points / 2)
    end

    it 'hit points should have increased value when constitution increased' do
      expected_result = subject.hit_points_per_level * 4 + 1
      expect do
        subject.level = 4
        subject.constitution += 1
        RuleProcessor.new(subject).process
      end.to change{subject.hit_points}.by(expected_result)
    end
  end
end
