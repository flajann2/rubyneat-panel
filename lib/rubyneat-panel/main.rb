module RubyNEAT
  module Panel
    def self.launch
      fox_get_component :app do |app|
        app.create_fox_components
        app.instance_final_activate
        app.activate
        app.run_application
      end
    end
    
    fx_app :app do
      app_name "RubyNEAT Panel"
      vendor_name "www.rubyneat.de"
      
      fx_main_window :main do
        title "RubyNEAT Panel"
        width 700
        height 400
        instance { |mw| mw.show PLACEMENT_SCREEN }
      end
    end
  end
end
