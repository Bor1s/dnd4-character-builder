require 'spec_helper'
require_relative "../shared/character/dragonborn_race.rb"

describe Character do

  specify { subject.should be }
  specify { subject.should respond_to :character_race }

  include_context "dragonborn race"
end
