require "rope"

require "rails"
require "action_controller"

require "omniauth/core"
require "omniauth/oauth"
require "bcrypt"

module Rope 
  class Engine < Rails::Engine 

    config.to_prepare do 
      ApplicationController.helper(Rope::SocialHelper)
    end

    initializer 'rope.load_middleware', :after => :load_config_initializers do 
      if Rope.service_configs[:twitter]
        config.app_middleware.user ::Rope::Strategies::Twitter,
          Rope.service_configs[:twitter].app_key,
          Rope.service_configs[:twitter].app_secret
      end
      
      if Rope.service_configs[:facebook]
        config.app_middleware.user ::Rope::Strategies::Facebook,
          Rope.service_configs[:facebook].app_key,
          Rope.service_configs[:facebook].app_secret,
          Rope.service_configs[:facebook].options
      end

      if Rope.service_configs[:linked_in]
        config.app_middleware.user ::Rope::Strategies::LinkedIn,
          Rope.service_configs[:linked_in].app_key,
          Rope.service_configs[:linked_in].app_secret
      end

      if Rope.service_configs[:github]
        config.app_middleware.user ::Rope::Strategies::Github,
          Rope.service_configs[:github].app_key,
          Rope.service_configs[:github].app_secret
      end

    end
  end
end
