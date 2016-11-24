module RubyNEAT
  module Panel
    def self.launch
      main = Main.new
      app_activate
    end
    
    class Main < FXMainWindow
      include Enhancement

      window do
        title "RubyNEAT Panel"
        show PLACEMENT_SCREEN
        width 700
        height 400
      end      
    end
  end
end
