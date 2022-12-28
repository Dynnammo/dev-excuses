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
      response.body.should_not eq(nil)
    end
  end

  context "when calling a specific excuse ID" do
    context "when argument provided is a valid integer" do
      context "when integer define an existing excuse" do
        it "should return the wanted excuse" do
          get "/12"
          response.status_code.should eq(200)
          JSON.parse(response.body)["data"]["index"].should eq(12)
        end
      end

      context "when integer does not define an existing excuse" do
        it "should return a specific error" do
          get "/999"
          response.status_code.should eq(404)
          JSON.parse(response.body).should eq({"data" => "Excuse with ID provided does not exist"})
        end
      end
    end

    context "when argument provided is not a valid integer" do
      it "should return a specific error" do
        get "/1dfe"
        response.status_code.should eq(404)
        JSON.parse(response.body).should eq({"data" => "You should provide a valid ID"})
      end
    end
  end
end
