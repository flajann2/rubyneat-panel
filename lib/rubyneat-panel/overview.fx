# Overview Tab

fx_tab_item { text "&Overview" }
fx_horizontal_frame (:overview_info) {
  opts STD_FRAME|LAYOUT_FILL_Y
  
  fx_group_box (:ov_connections_group) {
    text "Connections"
    opts STD_GROUPBOX|LAYOUT_FILL_Y
    
    fx_vertical_frame {
      opts LAYOUT_FILL_Y|LAYOUT_FILL_X #|PACK_UNIFORM_HEIGHT
      
      fx_group_box (:ov_conn_rabbitmq) {
        text "RabbitMQ"
        opts STD_GROUPBOX|LAYOUT_FILL_Y

        binding.fx :overview_rabbit_details
        binding.fx :overview_rabbit_channels
      }
      
      fx_group_box (:ov_conn_neaters) {
        text "NEATers"
        opts STD_GROUPBOX|LAYOUT_FILL_Y
        
        fx_horizontal_frame {
          opts PACK_UNIFORM_WIDTH|LAYOUT_FILL_X|LAYOUT_FILL_Y
          
          fx_group_box (:ov_conn_neaters_list) {
            text "List"
            opts  STD_GROUPBOX_HORIZ 
            
            fx_vertical_frame {
              opts STD_LAYOUT
              
              fx_list {
                opts LIST_EXTENDEDSELECT|STD_LAYOUT
                
                instance { |list|
                  list.appendItem "XOR"
                  list.appendItem "Pole Balancing"
                  list.appendItem "Face Recognition"
                  list.appendItem "Curve Fitting"
                }
              }
              
              fx_spring { opts LAYOUT_FILL_Y;  relw 10 }
                          
              fx_text_field (:ov_conn_neaters_selected) { opts LAYOUT_CENTER_X; ncols 40 }
              
              fx_spring { opts LAYOUT_FILL_Y;  relw 10 }                          
              fx_horizontal_frame {
                opts LAYOUT_CENTER_X
                fx_button (:ov_conn_neaters_run) { text "RUN" }
                fx_button (:ov_conn_neaters_halt) { text "STOP" }
              }
            }
          }
          
          fx_group_box {
            text "Details"
            opts STD_GROUPBOX_HORIZ
            fx_text (:ov_conn_neater_details) {
              opts ICONLIST_EXTENDEDSELECT|STD_LAYOUT
              instance { |t|
                t.text = "This can be beyond cool"
                t.editable = false
              }
            }
          }
        }
      }
    }
  }
}
