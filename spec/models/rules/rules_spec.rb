require 'spec_helper'

describe Rule do

  it 'should respond to :name' do
    subject.should respond_to :name
  end

  it 'should respond to :performs' do
    subject.should respond_to :performs
  end

  it 'should respond to :as_soon_as' do
    subject.should respond_to :as_soon_as
  end

  it 'should respond to :process' do
    subject.should respond_to :process
  end

  it 'should respond_to :root?' do
    subject.should respond_to :root?
  end

  context "#process" do
    specify { subject.should respond_to :parse_performs }
    specify { subject.should respond_to :parse_as_soon_as }

    it 'should engage parse_performs properly' do
      subject.stub(:performs => { what: [1, 2], how: :+ })
      subject.send(:parse_performs).should eq 3

      subject.stub(:performs => { what: 1 })
      subject.send(:parse_performs).should eq 1
    end

    it 'should engage parse_as_soon_as properly' do
      FactoryGirl.create(:foobar_rule)
      FactoryGirl.create(:barbaz_rule)

      subject.stub( as_soon_as: [ { foobar_rule: { more_then: 20 } } ])
      subject.send(:parse_as_soon_as).should be_false

      subject.stub( as_soon_as: [ { foobar_rule: { is: 1 } } ])
      subject.send(:parse_as_soon_as).should be_true

      subject.stub( as_soon_as: [ { foobar_rule: { any_of: [1,2,3] } } ])
      subject.send(:parse_as_soon_as).should be_true
    end

    it "of 'root' rule should be correct" do
      foobar = FactoryGirl.create(:foobar_rule)
      foobar.process.should eq 1
    end

    it 'of combined rules should be correct' do
      foobar = FactoryGirl.create(:foobar_rule)
      barbaz = FactoryGirl.create(:barbaz_rule)

      subject.stub(:performs => { what: :foobar_rule })
      subject.send(:parse_performs).should eq 1

      subject.stub(:performs => { what: [:foobar_rule, :barbaz_rule], how: :+ })
      subject.send(:parse_performs).should eq(1+2)
    end
  end

  context "interacting with Character" do
    subject { FactoryGirl.create(:some_rule) }

    it 'should respond to :character' do
      subject.should respond_to :character
    end

    it 'should raise exception if no such method in related character to store result' do
      subject.character = FactoryGirl.create(:character)
      expect { subject.process }.to raise_exception(Rule::NoStorageForRuleResultException)
    end

    it 'should process rule properly' do
      character = FactoryGirl.create(:character)

      class << character
        attr_accessor :some
      end

      subject.character = character

      subject.process
      subject.character.some.should eq 7
    end
  end

end
