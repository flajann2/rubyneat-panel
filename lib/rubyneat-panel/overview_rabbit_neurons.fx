fx_group_box {
  text "Neurons"
  opts CLEAN_GROUPBOX_HORIZ
  
  fx_list (:ov_conn_neurons_list) {
    opts LIST_EXTENDEDSELECT|STD_LAYOUT
    
    instance { |list|
      list.sel_clicked { |ll, selector, index|
        # do something
      }
    }
  }
}
