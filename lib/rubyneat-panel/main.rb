module RubyNEAT
  module Panel
    def self.launch
      main = Main.new
      app_activate
    end
    
    class Main < FXMainWindow
      include Enhancement
      
      def initialize
        super(application, "RubyNEAT Panel", width: 700, height: 400)
      end

      def create
        super
        show(PLACEMENT_SCREEN)
      end
    end
  end
end
