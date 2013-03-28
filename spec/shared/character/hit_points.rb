shared_context "hit points, healing surges and bloodied value" do

  before :all do
    @char = build_character(race: :dragonborn_character, level: 1)
  end

  context "calculation of" do
    it 'hit points should be corect' do
      @char.hit_points.should eq(@char.hit_points_at_first_level + @char.constitution + (@char.hit_points_per_level * @char.level_multiplier))
    end

    it 'healing surges should be correct' do
      @char.healing_surges.should eq (@char.healing_surges_per_day + @char.constitution_modifier)
    end

    it 'healing surge value should be correct (Draconic Heritage bonus)' do
      @char.healing_surge_value.should eq(@char.hit_points / 4 + @char.constitution_modifier) #+1 for dragonborn heritage.
    end

    it 'bloodied value should be correct' do
      @char.bloodied.should eq(@char.hit_points / 2)
    end

  end
end
