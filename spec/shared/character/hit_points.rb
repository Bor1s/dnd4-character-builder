shared_context "hit points" do

  context "#hit_points" do

    before :all do
      FactoryGirl.create(:hit_points_rule)
      FactoryGirl.create(:hit_points_by_level_rule)
      FactoryGirl.create(:start_hit_points_rule)
    end

    specify { subject.should respond_to :hit_points }


    it "should be calculated properly" do
      #subject.hit_points.should eq 
    end
  end
  
end
