require 'spec_helper'

describe Rest::RacesController do

  context "#index" do
    it "returns list of character races" do
      get :index
      result = JSON.parse response.body
      result["success"].should be_true
      result["races"].should_not be_empty
    end

    it "returns empty result" do
      Templates::Race.stub(:all).and_return([])
      get :index
      result = JSON.parse response.body
      result["success"].should be_false
      result["error"].should be
    end
  end
end