module RubyNEAT
  module Panel
    def self.launch
    end
    
    def self.test
      main = FXMainWindow.new(app, "RubyNEAT Dashboard", nil, nil, DECOR_NONE)
      FXButton.new(main, "&RubyNEAT Panel Test!", nil, app, FXApp::ID_QUIT)
      app.create()
      main.show(PLACEMENT_SCREEN)
      app.run()
    end
    
    class Main < FXMainWindow
    end
  end
end
