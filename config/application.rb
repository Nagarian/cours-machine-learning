require_relative 'boot'

require 'rails/all'
require 'rserve'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Lala
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.paths << Rails.root.join("public", "assets", "stylesheets")
    config.assets.paths << Rails.root.join("public", "assets", "javascripts")  
    
    config.filter_parameters << :password
    
    config.generators do |g|
      g.template_engine :slim
    end

  end
end
