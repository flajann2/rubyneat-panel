# coding: utf-8

module RubyNEAT
  module Panel
    def self.launch
      fox_component :app do |app|
        app.create_fox_components
        app.instance_final_activate
        app.activate
        Enhancement.activate_ingress_handlers app
        app.run_application
      end
    end

    binding.fx :main
    
    module Controller
      class << self
        attr_accessor :amqp
        
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
          @amqp[:routing]  = routing
          
          send_cmd :status, :all
          
          # We need to handle the replies
          @amqp[:reply].subscribe { |info, prop, payload|
            pl = Oj.load payload
            Enhancement.ingress << [pl.cmd, pl]
          }          
        end

        # Shorthand for send_command
        def send_cmd cmd_symbol, payload
          send_command NEAT::Daemon::Command.new cmd_symbol, payload
        end
        
        # Send given command object to the RubyNEAT daemom.
        # The reply will be handled asynchronously.
        def send_command cmd
          raise "Must be a command object" unless cmd.is_a? NEAT::Daemon::Command
          @amqp[:exchange].publish Oj.dump(cmd),
                                   routing_key: @amqp[:routing],
                                   correlation_id: cmd.call_id,
                                   reply_to: @amqp[:reply].name
        end
        
      end
    end
  end
end
