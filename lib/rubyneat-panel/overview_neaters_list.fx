fx_group_box (:ov_conn_neaters_list) {
  text "List"
  opts  STD_GROUPBOX_HORIZ 
  
  fx_vertical_frame {
    opts STD_LAYOUT
    
    fx_list(:ov_conn_neaters_widget_list) {
      opts LIST_EXTENDEDSELECT|STD_LAYOUT
      
      instance { |l|
        l.sel_clicked { |ll, selector, index|          
          ref(:ov_conn_neaters_selected).text = neater = ll.getItemText(index)
          ref(:ov_conn_neater_details).text = ''
          Controller.send_cmd :details, neater
        }
      }
    }
    
    fx_spring { opts LAYOUT_FILL_Y;  relw 10 }
    
    fx_text_field (:ov_conn_neaters_selected) { opts LAYOUT_CENTER_X; ncols 40 }
    
    fx_spring { opts LAYOUT_FILL_Y;  relw 10 }                          
    fx_horizontal_frame {
      opts LAYOUT_CENTER_X
      fx_button (:ov_conn_neaters_run) {
        text "RUN"
        instance { |b|
          b.sel_command {
            neater = ref(:ov_conn_neaters_selected).text
            ap neater
            Controller.send_cmd :run, neater 
          }
        }
      }
      
      fx_button (:ov_conn_neaters_halt) {
        text "STOP"
        instance{ |b|
          b.sel_command {
            puts "kill currently running neater"
            Controller.send_cmd :kill, neater 
          }
        }
      }
    }
  }
}
