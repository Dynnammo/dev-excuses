require "kemal"
require "./utils.cr"

module Dev::Excuses
  include Utils
  VERSION = "0.1.0"

  before_all do |env|
    env.response.content_type = "application/json"
  end

  get "/" do |env|
    halt env, status_code: 404, response: "Not implemented"
  end

  get "/random" do |env|
    locale = env.params.query["locale"]? || "en"
    data = Utils.data! Utils.path(locale)
    key = Random.rand(data.size)

    {"data": data[key]}.to_json
  end

  get "/:id" do |env|
    begin
      id = env.params.url["id"].to_i
      locale = env.params.query["locale"]? || "en"
      data = Utils.data! Utils.path(locale)

      wanted_excuse = data.as_a.select { |excuse| excuse["index"] == id }

      if wanted_excuse.empty?
        env.response.status_code = 404
        {"data": "Excuse with ID provided does not exist"}.to_json
      else
        {"data": wanted_excuse.first}.to_json
      end
    rescue exception

      env.response.status_code = 404
      {"data": "You should provide a valid ID"}.to_json
    end
  end

end

Kemal.run
