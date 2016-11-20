module RubyNEAT
  module Panel
    def self.launch
      main = Main.new
      Panel.app.create
      Panel.app.run
    end
    
    def self.test
      main = FXMainWindow.new(Panel.app, "RubyNEAT Dashboard", nil, nil, DECOR_NONE)
      FXButton.new(main, "&RubyNEAT Panel Test!", nil, Panel.app, FXApp::ID_QUIT)
      Panel.app.create()
      main.show(PLACEMENT_SCREEN)
      Panel.app.run()
    end
    
    class Main < FXMainWindow
      def initialize
        super(Panel.app, "RubyNEAT Panel", width: 700, height: 400)
      end

      def create
        super
        show(PLACEMENT_SCREEN)
      end
    end
  end
end
