require 'spec_helper'

describe Rules::Base do

  it 'should respond to :result' do
    subject.should respond_to :result
  end

  it 'should raise exception on :result' do
    expect { subject.result }.to raise_exception
  end
 
  it 'should respond to :condition_satisfied?' do
    subject.should respond_to :condition_satisfied?
  end
  
  it 'should raise exception on :condition_satisfied?' do
    expect { subject.condition_satisfied? }.to raise_exception
  end
end
