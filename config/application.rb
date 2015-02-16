require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MagicRealm
  class Application < Rails::Application
    # #Removes 'Access-Control-Allow-Origin' error on client app
    # config.action_dispatch.default_headers.clear

    #Adds in access just to make sure it's there
    # config.action_dispatch.default_headers.merge!({
    #   'Access-Control-Allow-Origin' => '*',
    #   'Access-Control-Request-Method' => '*'
    # })
  end
end
