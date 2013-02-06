shared_context "hit points, healing surges and bloodied value" do

  subject do
    build_character(race: :dragonborn_character, level: 1)
  end
  
  context "calculation of" do
    it 'hit points should be corect' do
      subject.hit_points.should eq(subject.hit_points_at_first_level + subject.constitution)
    end

    it 'healing surges should be correct' do
      subject.healing_surges.should eq (subject.healing_surges_per_day + subject.constitution_modifier)
    end

    it 'healing surge value should be correct' do
      subject.healing_surge_value.should eq(subject.hit_points / 4 + 1) #+1 for dragonborn heritage.
    end

    it 'bloodied value should be correct' do
      subject.bloodied.should eq(subject.hit_points / 2)
    end

  end
end
