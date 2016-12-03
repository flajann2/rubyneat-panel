module RubyNEAT
  module Panel
    def self.launch
      app_activate
    end
    
    @@app = fx_app do
      app_name "RubyNEAT Panel"
      vendor_name "www.rubyneat.de"
      
      fx_main_window :main do
        title "RubyNEAT Panel"
        width 700
        height 400
        instance { |mw| mw.show PLACEMENT_SCREEN }
      end

      instance do
        create
        run
      end
    end
  end
end
