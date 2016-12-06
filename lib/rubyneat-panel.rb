require 'thor'
require 'fxruby-enhancement'
require 'awesome_print'

include Fox
include Fox::Enhancement::Mapper

require_relative 'rubyneat-panel/assets'
require_relative 'rubyneat-panel/main'

module RubyNEAT
  module Panel
    extend Enhancement
    
    def self.start
      puts "We've started."
      launch
    end
  end
end
