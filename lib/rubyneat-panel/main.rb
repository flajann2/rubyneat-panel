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
        def connect url: nil, queue: nil, routing: nil, reply: nil
          puts "CONNECTING to #{url}"
          

        end
      end
    end
  end
end
