require "./spec_helper"

describe Dev::Excuses do
  it "should return a random excuses if path set correctly" do
    ["en", "fr"].each do |locale|
      get "/#{locale}/random" do |env|
        env.response.status_code == 200
      end
    end
  end
end
