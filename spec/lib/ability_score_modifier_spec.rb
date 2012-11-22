require 'spec_helper'

describe AbilityScoreGenerator do
  subject { AbilityScoreGenerator }

  specify { subject.should respond_to :roll_scores }

  it "calculates correct modifiers" do 
    subject.send(:modifier_of, 20).should eq(5)
    subject.send(:modifier_of, 21).should eq(5) 
    subject.send(:modifier_of, 22).should eq(6)
    subject.send(:modifier_of, 23).should eq(6)
    subject.send(:modifier_of, 24).should eq(7)
    subject.send(:modifier_of, 25).should eq(7)
    subject.send(:modifier_of, 1).should eq(-5)
    lambda { subject.send(:modifier_of, -1) }.should raise_exception 
  end

  describe "#standard_array" do
    specify { subject.should respond_to :standard_array }

    it "returns predefined ability scores" do
      subject.standard_array.should eq [16, 14, 13, 12, 11, 10]
    end
  end

  describe "#custom_scores" do
    specify { subject.should respond_to :custom_scores }

    it "returns hash with predefined values" do
      expected_result = { scores: [8, 10, 10, 10, 10, 10], spend_points: 22 }
      subject.custom_scores.should eq expected_result
    end

    it "gets proper score costs" do
      subject.send(:score_up_cost, 8).should eq 1
      subject.send(:score_up_cost, 9).should eq 1
      subject.send(:score_up_cost, 10).should eq 1
      subject.send(:score_up_cost, 11).should eq 1
      subject.send(:score_up_cost, 12).should eq 2
      subject.send(:score_up_cost, 13).should eq 3
      subject.send(:score_up_cost, 14).should eq 5
      subject.send(:score_up_cost, 15).should eq 7
      subject.send(:score_up_cost, 16).should eq 9
      subject.send(:score_up_cost, 17).should eq 12
      subject.send(:score_up_cost, 18).should eq 16
      lambda { subject.send(:score_up_cost, 100500) }.should raise_exception 
    end
  end
end
