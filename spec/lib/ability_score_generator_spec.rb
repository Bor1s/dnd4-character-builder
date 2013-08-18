require 'spec_helper'

describe AbilityScoreGenerator do
  subject { AbilityScoreGenerator }

  it "calculates correct modifiers" do 
    subject.modifier_of(20).should eq 5
    subject.modifier_of(21).should eq 5
    subject.modifier_of(22).should eq 6
    subject.modifier_of(23).should eq 6
    subject.modifier_of(24).should eq 7
    subject.modifier_of(25).should eq 7
    subject.modifier_of(1).should eq -5
    subject.modifier_of(-1).should < 0
  end

  describe ".standard_array" do
    specify { subject.should respond_to :standard_array }

    it "returns predefined ability scores" do
      subject.standard_array.should eq [16, 14, 13, 12, 11, 10]
    end
  end

  describe ".custom_ability_scores" do
    specify { subject.should respond_to :custom_ability_scores }

    context "for new character without level" do
      it "returns spend points for 0-3 lvl" do
        expected_result = {spend_points: 22, to_all_value: 0}
        subject.custom_ability_scores(0,3).should eq expected_result
      end

      it "returns spend points for 0-4 lvl" do
        expected_result = {spend_points: 24, to_all_value: 0}
        subject.custom_ability_scores(0,4).should eq expected_result
      end

      it "returns spend points for 0-12 lvl" do
        expected_result = {spend_points: 26, to_all_value: 1}
        subject.custom_ability_scores(0,12).should eq expected_result
      end

      it "returns spend points for 0-22 lvl" do
        expected_result = {spend_points: 30, to_all_value: 2}
        subject.custom_ability_scores(0,22).should eq expected_result
      end

      it "returns spend points for 0-30 lvl" do
        expected_result = {spend_points: 34, to_all_value: 2}
        subject.custom_ability_scores(0,30).should eq expected_result
      end
    end

    context "for existing character with level" do
      it 'returns spend points for 1-3 lvl' do
        expected_result = {spend_points: 0, to_all_value: 0}
        subject.custom_ability_scores(1,2).should eq expected_result
      end

      it "returns spend points for 1-7 lvl" do
        expected_result = {spend_points: 2, to_all_value: 0}
        subject.custom_ability_scores(1,7).should eq expected_result
      end

      it "returns spend points for 1-13 lvl" do
        expected_result = {spend_points: 4, to_all_value: 1}
        subject.custom_ability_scores(1,13).should eq expected_result
      end

      it "returns spend points for 8-17 lvl" do
        expected_result = {spend_points: 2, to_all_value: 1}
        subject.custom_ability_scores(8,17).should eq expected_result
      end

      it "returns spend points for 10-28 lvl" do
        expected_result = {spend_points: 8, to_all_value: 2}
        subject.custom_ability_scores(10,28).should eq expected_result
      end

      it "returns spend points for 1-30 lvl" do
        expected_result = {spend_points: 12, to_all_value: 2}
        subject.custom_ability_scores(1,30).should eq expected_result
      end
    end

    it "gets proper score costs" do
      subject.score_up_cost(8).should eq 1
      subject.score_up_cost(9).should eq 1
      subject.score_up_cost(10).should eq 1
      subject.score_up_cost(11).should eq 1
      subject.score_up_cost(12).should eq 1
      subject.score_up_cost(13).should eq 1
      subject.score_up_cost(14).should eq 2
      subject.score_up_cost(15).should eq 2
      subject.score_up_cost(16).should eq 2
      subject.score_up_cost(17).should eq 3
      subject.score_up_cost(18).should eq 4
      lambda { subject.score_up_cost(100500) }.should raise_exception 
    end
  end

  describe ".roll_ability_scores" do
    specify { subject.should respond_to :roll_ability_scores }

    it "should provide 6 ability scores with modifiers in 4..8 range" do
      modifiers_sum = subject.roll_ability_scores.map { |as| subject.modifier_of(as) }.sum

      (4..8).should cover(modifiers_sum)
    end
  end
end
