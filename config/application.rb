require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Odsalimenta
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.i18n.default_locale = :es ##esto configura para que el archivo es.yml que esta dentro de config/locales, sea el idioma por defecto
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # 
    #
    #
    use Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: :any
      end
    end
  end
end
