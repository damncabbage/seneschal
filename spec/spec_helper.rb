$:.unshift File.expand_path("../lib", File.dirname(__FILE__))

require "simplecov"
SimpleCov.start do
  add_filter "/spec/"
end
require "rspec"

# Helpers from spec/support/*
Dir["#{File.dirname(__FILE__)}/support/**/*_helpers.rb"].each {|f| require f }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.order = :rand
end
