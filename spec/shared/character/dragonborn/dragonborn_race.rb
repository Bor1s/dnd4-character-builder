Dir.glob(File.expand_path(File.join(File.dirname(__FILE__), "levels", "*.rb"))).each do |name|
  require name
end

shared_context "dragonborn race" do
  include_context "1st level dragonborn"
  include_context "2nd level dragonborn"
  include_context "3nd level dragonborn"
  include_context "4nd level dragonborn"
  include_context "5nd level dragonborn"
end
