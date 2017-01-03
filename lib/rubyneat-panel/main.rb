# coding: utf-8

module RubyNEAT
  module Panel
    def self.launch
      fox_component :app do |app|
        app.create_fox_components
        app.instance_final_activate
        app.activate
        Controller.initiate_response_handler
        app.run_application
      end
    end

    binding.fx :main
    
    module Controller
      class << self
        attr_accessor :amqp

        def initiate_response_handler
          puts "response_handler_called but not implemented"
        end
        
        def connect url: nil,
                    queue: nil,
                    routing: nil
          puts "CONNECTING to #{url}"
                # Setup the AMQP channel
          @amqp ||= {}
          @amqp[:conn] = Bunny.new (@amqp[:url] = url)
          @amqp[:conn].start
          @amqp[:channel]  = @amqp[:conn].create_channel
          @amqp[:queue]    = @amqp[:channel].queue(@amqp[:queue_name] = queue)
          @amqp[:exchange] = @amqp[:channel].default_exchange          
          @amqp[:reply]    = @amqp[:channel].queue('', exclúsive: true, auto_delete: true)

          cmd = NEAT::Daemon::Command.new :status
          cmd.payload = :all
          @amqp[:exchange].publish Oj.dump(cmd),
                                   routing_key: routing,
                                   correlation_id: cmd.call_id,
                                   reply_to: @amqp[:reply].name
          
          # We need to handle the replies
          @amqp[:reply].subscribe { |info, prop, payload|
            Enhancement.ingress << Oj.load( payload )
          }          
        end
      end
    end
  end
end
