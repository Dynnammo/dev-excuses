require "kemal"
require "./utils.cr"

module Dev::Excuses
  include Utils
  VERSION = "0.1.0"

  before_all do |env|
    env.response.content_type = "text/plain;charset=UTF-8"
  end

  get "/:locale/random" do |env|
    locale = env.params.url["locale"]
    data = Utils.data! Utils.path(locale)
    key = data.as_h.keys[Random.rand(data.size)]
    
    data[key].to_s
  end
end

Kemal.run
