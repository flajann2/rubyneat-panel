# coding: utf-8

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

    STD_FRAME      = FRAME_THICK | FRAME_RAISED
    STD_SEPERATOR  = LAYOUT_SIDE_TOP | LAYOUT_FILL_X | SEPARATOR_GROOVE
    STD_LAYOUT     = LAYOUT_FILL_X | LAYOUT_FILL_Y
    
    CLEAN_GROUPBOX = GROUPBOX_NORMAL 
    STD_GROUPBOX   = CLEAN_GROUPBOX | FRAME_GROOVE | LAYOUT_FILL_X 
    
    CLEAN_GROUPBOX_HORIZ  = GROUPBOX_NORMAL | LAYOUT_FILL_X | LAYOUT_FILL_Y
    STD_GROUPBOX_HORIZ  = CLEAN_GROUPBOX_HORIZ | FRAME_GROOVE
    
    fx_app :app do
      app_name "RubyNEAT Panel"
      vendor_name "www.rubyneat.de"
      
      fx_tool_tip {}

      fxpng_icon (:logo_banner) {
        File.open(Assets::BANNER, "r") { |f| pix f.read  }
      }
      
      fx_main_window (:main) do
        title "RubyNEAT Panel"
        width 900
        height 700
        instance { |mw| mw.show PLACEMENT_SCREEN }

        fx_label {
          opts LAYOUT_SIDE_TOP|LAYOUT_FILL_X
          text ""
          instance { |l|  l.icon = ref :logo_banner }
        }
        fx_horizontal_separator { opts STD_SEPERATOR }
        fx_horizontal_frame do
          opts LAYOUT_SIDE_TOP|FRAME_NONE|STD_LAYOUT|PACK_UNIFORM_WIDTH
          fx_tab_book (:tab_book) do
            opts STD_LAYOUT

            # Tabs
            binding.fx "overview"
            binding.fx "settings"
            binding.fx "critters"
            binding.fx "stats"
          end
        end
      end
    end
  end
end
