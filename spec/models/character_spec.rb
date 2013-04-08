require 'spec_helper'
require_relative "../shared/character/races.rb"
require_relative "../shared/character/classes.rb"
require_relative "../shared/character/hit_points.rb"
require_relative "../shared/character/ability_scores.rb"
require_relative "../shared/character/feats.rb"
require_relative "../shared/character/defences.rb"

describe Character do
  include_context "ability scores"
  include_context "hit points, healing surges and bloodied value"
  include_context "races"
  include_context "classes"
  include_context "feats"
  include_context "defences"
end
