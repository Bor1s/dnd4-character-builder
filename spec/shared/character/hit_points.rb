shared_context "hit points" do
  context "#hit_points" do
    specify { subject.should respond_to :hit_points }
    it "should be calculated properly" do
      Rule.stub(:hit_points => FactoryGirl.build(:hit_points))
      subject.stub_chain(:character_class, :basic_hit_points).and_return(12)
      subject.stub_chain(:character_class, :per_level_hit_points).and_return(5)
      subject.stub(:level => 1)
      subject.stub_chain(:ability_scores, :constitution).and_return(13)

      expected_result = 25

      eval(Rule.hit_points.formula, subject.send(:get_binding)).call.should eq expected_result
    end
  end

  context "#healing_surges" do
    specify { subject.should respond_to :healing_surges }
    it "should be calculated properly" do
    end
  end

  context "#bloodied_value" do
    specify { subject.should respond_to :bloodied_value }
    it "should be calculated properly" do
    end
  end
end
