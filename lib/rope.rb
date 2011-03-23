module Rope 
  require "rope/service_config"

  # Twitter & Facebook app configs
  mattr_accessor :service_configs
  @@service_configs = {}

  def self.setup
    yield self
  end

  # config.twitter APP_KEY, APP_SECRET, :scope => ['foo', 'bar']
  def self.twitter(app_key, app_secret, options = {})
    @@service_configs[:twitter] = Rope::ServiceConfig.new(app_key, app_secret, options)
  end

  def self.facebook(app_key, app_secret, options = {})
    @@service_configs[:facebook] = Rope::ServiceConfig.new(app_key, app_secret, options)
  end

  def self.linked_in(app_key, app_secret, options = {})
    @@service_configs[:linked_in] = Rope::ServiceConfig.new(app_key, app_secret, options)
  end

  def self.github(app_key, app_secret, options = {})
    @@service_configs[:github] = Rope::ServiceConfig.new(app_key, app_secret, options)
  end

  require "rope/engine" if defined?(Rails) && Rails::VERSION::MAJOR == 3

end

require "extensions/action_controller/base"
