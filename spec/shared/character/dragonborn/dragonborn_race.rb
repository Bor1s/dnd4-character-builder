require_relative 'levels/first.rb'
require_relative 'levels/second.rb'

shared_context "dragonborn race" do
  include_context "1st level dragonborn"
  include_context "2nd level dragonborn"
end
