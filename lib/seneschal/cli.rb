require 'seneschal'
require 'thor'

class Seneschal::CLI < Thor
  map %w(-v --version) => :version

  desc "version", "Display Seneschal gem version"
  def version
    puts Seneschal::VERSION
  end
end
