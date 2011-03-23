require "rails/generators"

module Rope 
  module Generators 
    class RopeGenerator < Rails::Generators::Base 
      desc 'Creates a Rope initializer and models'

      def self.source_root
        File.join(File.dirname(__FILE__), 'templates')
      end

      def copy_initializer
        template 'rope.rb', 'config/initializers/rope.rb'
      end

      # TODO: Add copy method for models to their folders
      def copy_user_model
        template 'user.rb', 'app/models/user.rb'
      end

      def show_readme
        readme 'README' if behavior == :invoke
      end

    end
  end
end
