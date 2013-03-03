require 'spec_helper'

describe Rest::LanguagesController do
  
  context "#index" do
    it "returns list of languages" do
      get :index
      result = JSON.parse response.body
      result["success"].should be_true
      result["languages"].should_not be_empty
    end
    
    it "returns empty result" do
      Templates::Language.stub(:all).and_return([])
      get :index
      result = JSON.parse response.body
      result["success"].should be_false
      result["error"].should be
    end
  end
end
