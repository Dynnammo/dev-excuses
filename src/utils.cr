require "yaml"

module Utils
  extend self
  def path(locale)
    "src/config/locales/#{locale}.yml"
  end

    def data!(path)
      File.open(path) { |file| YAML.parse(file)["excuses"] }
    end
end