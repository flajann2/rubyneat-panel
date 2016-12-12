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

    STD_FRAME     = FRAME_THICK | FRAME_RAISED
    STD_SEPERATOR = LAYOUT_SIDE_TOP | LAYOUT_FILL_X | SEPARATOR_GROOVE
    STD_LAYOUT    = LAYOUT_FILL_X | LAYOUT_FILL_Y
    STD_GROUPBOX  = GROUPBOX_NORMAL | LAYOUT_FILL_X | FRAME_GROOVE
    STD_GROUPBOX_HORIZ  = GROUPBOX_NORMAL | LAYOUT_FILL_X | LAYOUT_FILL_Y | FRAME_GROOVE
    
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
            
            binding.fx "overview"
            
            fx_tab_item { text "&Control Settings" }
            fx_horizontal_frame {
              opts STD_FRAME
              fx_file_list {
                opts ICONLIST_EXTENDEDSELECT|STD_LAYOUT
              }
            }
            
            
            fx_tab_item { text "C&ritters" }
            fx_horizontal_frame {
              opts STD_FRAME
              fx_dir_list { opts DIRLIST_SHOWFILES|TREELIST_SHOWS_LINES|TREELIST_SHOWS_BOXES|STD_LAYOUT }
            }

            fx_tab_item { text "&View" }
            fx_horizontal_frame { opts STD_FRAME }

            fx_menu_pane {
              fx_menu_command { text "Something Special"; selector FXTabBar::ID_OPEN_FIRST+0 }
              fx_menu_command { text "Not So Special"; selector FXTabBar::ID_OPEN_FIRST+1 }
            }
          end
        end
      end
    end
  end
end
