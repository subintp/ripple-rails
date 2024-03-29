require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ripple
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths.push(*%W(#{config.root}/lib
                                   #{config.root}/app/services
                                   #{config.root}/app/builders
                                   #{config.root}/app/decorators
                                   ))
  end
end
