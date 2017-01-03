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
          
          binding.fx :overview_neaters_list
          binding.fx :overview_neaters_details
        }
      }
    }
  }
}
