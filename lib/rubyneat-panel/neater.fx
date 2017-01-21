# coding: utf-8
# Neater tab
fx_tab_item { text "&Neater" }
fx_horizontal_frame {
  opts STD_FRAME
  
  fx_vertical_frame {
    opts STD_FRAME|STD_LAYOUT
    fx_label {
      text "xor Generation 999"
      opts LAYOUT_FILL_X|FRAME_LINE
    }
    
    fx_canvas (:neater_evolution_chart) {
      opts FRAME_RAISED
    }
    
    fx_horizontal_frame {
      opts STD_FRAME|LAYOUT_FILL_X
      
      fx_button (:neater_button_run) {
        opts CENTER_BUTTON
        text "Run"
      }
      fx_button (:neater_button_pause) {
        opts CENTER_BUTTON
        text "Pause"
      }
      fx_button (:neater_button_step) {
        opts CENTER_BUTTON
        text "Step"
      }
      fx_button (:neater_button_reset) {
        opts CENTER_BUTTON
        text "Reset"
      }
      
      fx_group_box {
        text "Stats"
        opts STD_GROUPBOX|STD_LAYOUT
        fx_text (:neater_current_stats) {
          opts ICONLIST_EXTENDEDSELECT|STD_LAYOUT
          instance { |t| t.editable = false }
        }
      }
    }
  }
  
  fx_vertical_frame {
    opts FRAME_SUNKEN|STD_LAYOUT
    fx_table (:neater_properties_table) {
      opts STD_LAYOUT
    }
  }
}
