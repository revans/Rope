require "rails/generators"

class RopeGenerator < Rails::Generators::Base 
  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end
end
