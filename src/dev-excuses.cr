require "kemal"

module Dev::Excuses
  VERSION = "0.1.0"

  get "/" do
    "Hello, world !"
  end

end

Kemal.run
