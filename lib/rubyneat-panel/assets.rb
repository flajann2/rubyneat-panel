module RubyNEAT
  module Panel
    module Assets
      NPANEL_IMAGE_PATH = File.expand_path '../../images', File.dirname(__FILE__)
      BANNER = File.expand_path 'panel-logo-100h.png', NPANEL_IMAGE_PATH
      ICON   = File.expand_path 'panel-icon.png', NPANEL_IMAGE_PATH
    end
  end
end
