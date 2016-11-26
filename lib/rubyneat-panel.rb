require 'thor'
require 'fxruby-enhancement'

include Fox

require_relative 'rubyneat-panel/main'

module RubyNEAT
  module Panel
    extend Enhancement
    
    def self.start
      puts "We've started. Running test."
      app_set "RubyNEAT Panel", "www.RubyNEAT.de"
      require 'pry'; binding.pry #DEBUGGING
      launch
    end
  end
end
