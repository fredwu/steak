require 'rails/generators'
require 'active_support/inflector/inflections'

module Steak
  class SpecGenerator < Rails::Generators::NamedBase
    source_root File.join(File.dirname(__FILE__), 'templates')

    desc <<-DESC
Description:
    Create an acceptance spec for the feature NAME in the
    'spec/acceptance' folder.

Example:
    `rails generate steak:spec checkout`

    Creates an acceptance spec for the "checkout" feature:
        spec/acceptance/checkout_spec.rb
DESC

    def manifest
      empty_directory File.join('spec/acceptance', class_path)
      file_name.gsub!(/_spec$/, "")

      @feature_name  = file_name.titleize
      @relative_path = ""

      class_path.size.times { @relative_path << '../' }

      template 'acceptance_spec.rb', File.join('spec/acceptance', class_path, "#{file_name}_spec.rb")
    end
  end
end
