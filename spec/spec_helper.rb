# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rspec/rails"
require "database_cleaner"
require "webrat"
require "mongoid-rspec"

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  
  config.include Mongoid::Matchers

  config.before(:suite) do 
    DatabaseCleaner.strategy = :truncation 
    DatabaseCleaner.orm = "mongoid"
  end

  config.before(:all) do 
    DatabaseCleaner.clean
  end
end
