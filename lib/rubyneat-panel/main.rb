# coding: utf-8

module RubyNEAT
  module Panel
    def self.launch
      fox_component :app do |app|
        app.create_fox_components
        app.instance_final_activate
        app.activate
        app.run_application
      end
    end

    binding.fx :main
    
    module Controller
      class << self
        attr_accessor :amqp
        
        def connect url: nil,
                    queue: nil,
                    routing: nil,
                    reply: nil
          puts "CONNECTING to #{url}"
                # Setup the AMQP channel
          @amqp ||= {}
          @amqp[:conn] = Bunny.new (@amqp[:url] = url)
          @amqp[:conn].start
          @amqp[:channel]  = @amqp[:conn].create_channel
          @amqp[:queue]    = @amqp[:channel].queue(@amqp[:queue_name] = queue)
          @amqp[:exchange] = @amqp[:channel].default_exchange

        end
      end
    end
  end
end
