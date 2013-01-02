require 'spec_helper'
require_relative "../shared/character/dragonborn_race.rb"
require_relative "../shared/character/hit_points.rb"

describe Character do
  specify { subject.should respond_to :character_race }

  include_context "dragonborn race"
end
