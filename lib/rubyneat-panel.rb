require 'thor'
require 'fxruby-enhancement'
require 'awesome_print'

include Fox

require_relative 'rubyneat-panel/main'

module RubyNEAT
  module Panel
    extend Enhancement
    
    def self.start
      puts "We've started. Running test."
      app_set "RubyNEAT Panel", "www.RubyNEAT.de"
      launch
    end
  end
end
