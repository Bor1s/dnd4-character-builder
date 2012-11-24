#TODO refactor this specs

shared_context "hit points" do

  context "#hit_points" do
    specify { subject.should respond_to :hit_points }
    it "should be calculated properly" do
      subject.stub(:level => 1)
      subject.stub_chain(:character_class, :basic_hit_points).and_return(12)
      subject.stub_chain(:character_class, :per_level_hit_points).and_return(5)
      subject.stub_chain(:ability_scores, :constitution).and_return(13)
      
      Rule.stub(:hit_points => FactoryGirl.build(:hit_points))

      expected_result = 25

      subject.hit_points.should eq expected_result
    end
  end

  context "#healing_surges" do
    specify { subject.should respond_to :healing_surges }
    it "should be calculated properly" do
      Rule.stub(:healing_surges => FactoryGirl.build(:healing_surges))
      subject.stub_chain(:character_class, :healing_surges_per_day).and_return(7)
      subject.stub_chain(:ability_scores, :constitution_modifier).and_return(2)

      expected_result = 9

      subject.healing_surges.should eq expected_result
    end
  end

  context "#healing_surge_value" do
    specify { subject.should respond_to :healing_surge_value }
    it "should be calculated properly without any bonuses" do
      subject.stub(:level => 1)
      subject.stub_chain(:character_class, :basic_hit_points).and_return(12)
      subject.stub_chain(:character_class, :per_level_hit_points).and_return(5)
      subject.stub_chain(:ability_scores, :constitution).and_return(13)
      subject.stub(:character_race => FactoryGirl.build(:dwarf))
      subject.character_race.stub(:character => subject)
      
      Rule.stub(:hit_points => FactoryGirl.build(:hit_points))
      Rule.stub(:healing_surge_value => FactoryGirl.build(:healing_surge_value))

      expected_result = 6

      subject.healing_surge_value.should eq expected_result
    end

    it "should be calculated properly with racial trait bonus (Dragonborn heritage (+ Con mod to healing surges))" do
      subject.stub(:level => 1)
      subject.stub_chain(:character_class, :basic_hit_points).and_return(12)
      subject.stub_chain(:character_class, :per_level_hit_points).and_return(5)
      subject.stub_chain(:ability_scores, :constitution).and_return(13)
      subject.stub_chain(:ability_scores, :constitution_modifier).and_return(2)
      subject.stub(:character_race => FactoryGirl.build(:dragonborn))
      subject.character_race.stub(:character => subject)
      
      Rule.stub(:hit_points => FactoryGirl.build(:hit_points))
      Rule.stub(:healing_surge_value => FactoryGirl.build(:healing_surge_value))

      expected_result = 8

      subject.healing_surge_value.should eq expected_result
    end
  end

  context "#bloodied_value" do
    specify { subject.should respond_to :bloodied_value }
    it "should be calculated properly" do
      subject.stub(:level => 1)
      subject.stub_chain(:character_class, :basic_hit_points).and_return(12)
      subject.stub_chain(:character_class, :per_level_hit_points).and_return(5)
      subject.stub_chain(:ability_scores, :constitution).and_return(13)
      
      Rule.stub(:hit_points => FactoryGirl.build(:hit_points))
      Rule.stub(:bloodied_value => FactoryGirl.build(:bloodied_value))

      expected_result = 12

      subject.bloodied_value.should eq expected_result
    end
  end
end
