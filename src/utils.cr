require "yaml"

module Utils
  extend self
  def get_path_from_locale(locale)
    "src/config/locales/#{locale}.yml"
  end

    def get_data(path)
      data = File.open(path) { |file| YAML.parse(file)["excuses"] }
    end
end