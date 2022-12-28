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

end

Kemal.run
