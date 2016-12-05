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
      
      fx_tool_tip {}
      
      fx_main_window :main do
        title "RubyNEAT Panel"
        width 700
        height 400
        instance { |mw| mw.show PLACEMENT_SCREEN }

        #fx_menu_bar { opts LAYOUT_SIDE_TOP|LAYOUT_FILL_X }
        fx_horizontal_separator { opts LAYOUT_SIDE_TOP|LAYOUT_FILL_X|SEPARATOR_GROOVE }
        fx_horizontal_frame do
          opts LAYOUT_SIDE_TOP|FRAME_NONE|LAYOUT_FILL_X|LAYOUT_FILL_Y|PACK_UNIFORM_WIDTH
          fx_tab_book do
            fx_tab_item { text "&Overview" }
            fx_horizontal_frame {
              opts FRAME_THICK|FRAME_RAISED
              fx_list {
                opts LIST_EXTENDEDSELECT|LAYOUT_FILL_X|LAYOUT_FILL_Y
                instance { |list|
                  list.appendItem "First"
                  list.appendItem "Second"
                  list.appendItem "Third"
                }
              }
            }
            fx_tab_item { text "&Stats" }
            fx_tab_item { text "&Critter" }
          end
        end
      end
    end
  end
end
