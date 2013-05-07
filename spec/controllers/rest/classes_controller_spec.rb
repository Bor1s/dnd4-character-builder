require 'spec_helper'

describe Rest::ClassesController do
  context "#index" do
    it "returns list of available character classes" do
      get :index, format: :json 

      body = JSON.parse(response.body)
      body.should_not be_empty
    end
  end
end
