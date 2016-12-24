module RubyNEAT
  module Panel
    module Cli
      class Main < Thor
        class_option :url,
                     type: :string,
                     banner: 'URL like amqp://guest:guest@localhost:5672',
                     default: ENV['RUBYNEAT_AMQP_URL'] || 'amqp://guest:guest@localhost:5672',
                     aliases: '-a'
      
        class_option :routing,
                     type: :string,
                     banner: '<routing_name>',
                     default: ENV['RUBYNEAT_AMQP_ROUTING'] || 'rubyneat_cmd',
                     aliases: '-r'
      
        class_option :queue,
                     type: :string,
                     banner: '<queue_name>',
                     default: ENV['RUBYNEAT_AMQP_QUEUE'] || 'rubyneat_cmd',
                     aliases: '-q'
      
        class_option :reply,
                     type: :string,
                     banner: '<reply_to_name>',
                     default: ENV['RUBYNEAT_AMQP_REPLY_TO'] || 'rubyneat_reply',
                     aliases: '-y'

        desc 'gui', 'Display the Panel GUI'

        def gui
          Panel::opts = options
          Panel.launch
        end
        default_task :gui
        
      end
    end
  end
end

