require 'thor'
require 'fxruby-enhancement'

include Fox

require_relative 'rubyneat-panel/main'

module RubyNEAT
  module Panel
    def self.start
      puts "We've started. Running test."
      Enhancement.app_set "RubyNEAT Panel", "www.RubyNEAT.de"
      launch
      test
    end
  end
end
