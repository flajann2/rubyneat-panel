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
    
    fx_app :app do
      app_name "RubyNEAT Panel"
      vendor_name "www.rubyneat.de"
      
      fx_tool_tip {}
      
      fx_main_window (:main) do
        title "RubyNEAT Panel"
        width 700
        height 400
        instance { |mw| mw.show PLACEMENT_SCREEN }

        fx_menu_bar { opts LAYOUT_SIDE_TOP|LAYOUT_FILL_X }
        fx_horizontal_separator { opts STD_SEPERATOR }
        fx_horizontal_frame do
          opts LAYOUT_SIDE_TOP|FRAME_NONE|STD_LAYOUT|PACK_UNIFORM_WIDTH
          fx_tab_book :tab_book do
            opts STD_LAYOUT
            
            fx_tab_item { text "&Overview" }
            fx_horizontal_frame (:overview_info) {
              opts STD_FRAME
              fx_group_box (:ov_connections_group) {
                text "Connections"
                opts STD_GROUPBOX
                
                fx_group_box (:ov_conn_rabbitmq) {
                  text "RabbitMQ"
                  opts STD_GROUPBOX
                  
                  fx_list {
                    opts LIST_EXTENDEDSELECT|STD_LAYOUT
                    instance { |list|
                      list.appendItem "First"
                      list.appendItem "Second"
                      list.appendItem "Third"
                    }
                  }
                }

                fx_group_box (:ov_conn_neaters){
                  text "NEATers"
                  opts STD_GROUPBOX
                }
              }
            }
            
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
