require 'spec_helper'

describe Rest::ClassesController do
  context "#index" do
    it "returns list of available character classes" do
      get :index, format: :json 

      body = JSON.parse(response.body)
      body.should include("success", "classes")
      body["success"].should be_true
      body["classes"].should_not be_empty
    end

    it "returns error message if no classes found" do
      Templates::Klass.stub(:all).and_return([])
      get :index, format: :json 

      body = JSON.parse(response.body)
      body.should include("success", "error")
      body["success"].should be_false
      body["error"].should_not be_empty
    end
  end
end
