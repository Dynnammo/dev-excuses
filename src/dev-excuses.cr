require "kemal"
require "yaml"

module Dev::Excuses
  VERSION = "0.1.0"
  
  data = File.open("src/data/excuses.yml") do |excuses|
    YAML.parse(excuses)["data"]
  end

  get "/" do
    key = data.as_h.keys[Random.rand(data.size)]
    
    data[key].to_s
  end

end

Kemal.run
