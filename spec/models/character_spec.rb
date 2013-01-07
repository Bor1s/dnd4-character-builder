require 'spec_helper'
require_relative "../shared/character/dragonborn/level_independent/hit_points.rb"
require_relative "../shared/character/dragonborn/level_independent/ability_scores.rb"
require_relative "../shared/character/dragonborn/dragonborn_race.rb"

describe Character do
  specify { subject.should respond_to :character_race }

  include_context "ability scores"
  include_context "dragonborn race"
end
