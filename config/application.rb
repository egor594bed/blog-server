require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    config.api_only = true
    config.load_defaults 7.0
  end
end
