module RubyNEAT
  module Panel
    def self.launch
      main = Main.new
      Enhancement.app.create
      Enhancement.app.run
    end
    
    def self.test
      main = FXMainWindow.new(Enhancement.app, "RubyNEAT Dashboard", nil, nil, DECOR_NONE)
      FXButton.new(main, "&RubyNEAT Panel Test!", nil, Panel.app, FXApp::ID_QUIT)
      Enhancement.app.create()
      main.show(PLACEMENT_SCREEN)
      Enhancement.run()
    end
    
    class Main < FXMainWindow
      include Enhancement
      
      def initialize
        super(Enhancement.app, "RubyNEAT Panel", width: 700, height: 400)
      end

      def create
        super
        show(PLACEMENT_SCREEN)
      end
    end
  end
end
