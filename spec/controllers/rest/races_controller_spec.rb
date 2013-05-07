require 'spec_helper'

describe Rest::RacesController do

  context "#index" do
    it "returns list of character races" do
      get :index
      result = JSON.parse response.body
      result.should_not be_empty
    end
  end
end
