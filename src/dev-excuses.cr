require "kemal"
require "./utils.cr"

module Dev::Excuses
  include Utils
  VERSION = "0.1.0"

  get "/:locale/random" do |env|
    env.response.content_type = "text/plain;charset=UTF-8"
    locale = env.params.url["locale"]
    path = Utils.get_path_from_locale(locale)
    data = Utils.get_data(path)
    key = data.as_h.keys[Random.rand(data.size)]
    
    data[key].to_s
  end
end

Kemal.run
