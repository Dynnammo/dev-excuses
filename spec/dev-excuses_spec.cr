require "./spec_helper"

describe Dev::Excuses do
  context "when calling main route" do
    it "should return an error since not implemented yet" do
      get "/"
      response.status_code.should eq(404)
    end
  end

  context "when calling the random route" do
    it "should return a random excuse" do
      get "/random"
      response.status_code.should eq(200)
      response.body.not_nil!
    end
  end
end
