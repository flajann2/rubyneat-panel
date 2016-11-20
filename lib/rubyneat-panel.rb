require 'thor'
require 'fox16'

include Fox

require_relative 'rubyneat-panel/main'

module RubyNEAT
  module Panel
    def self.start
      puts "We've started. Running test."
      @@application = FXApp.new("RubyNEAT Panel", "Dashboard")
      launch
      test
    end

    def self.app
      @@application
    end    
  end
end
