fx_group_box (:ov_conn_neaters_list) {
  text "List"
  opts  STD_GROUPBOX_HORIZ 
  
  fx_vertical_frame {
    opts STD_LAYOUT
    
    fx_list {
      opts LIST_EXTENDEDSELECT|STD_LAYOUT
      
      instance { |list|
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
