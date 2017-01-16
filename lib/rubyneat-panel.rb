require 'thor'
require 'fxruby-enhancement'
require 'awesome_print'
require 'rubyneat/daemon'
require 'oj'
require 'bunny'
require 'securerandom'
require 'yaml'

include Fox
include Fox::Enhancement::Mapper

require_relative 'rubyneat-panel/assets'
require_relative 'rubyneat-panel/main'
require_relative 'rubyneat-panel/cli'

module RubyNEAT
  module Panel
    extend Enhancement

    class << self
      attr_accessor :opts
      
      def start
        Cli::Main.start
      end
    end
    
  end
end
