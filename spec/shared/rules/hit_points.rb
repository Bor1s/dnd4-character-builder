shared_context "hit points" do
  it 'should calculate correct hit points' do
    #Only character_class.hit_points_at_first_level is calculated
    FactoryGirl.create(:hit_points_rule)
    FactoryGirl.create(:hit_points_by_level_rule)
    FactoryGirl.create(:start_hit_points_rule)

    subject.process
    subject.character.hit_points.should eq 12
  end
end
