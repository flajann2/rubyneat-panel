fx_group_box {
  text "Channels"
  opts CLEAN_GROUPBOX_HORIZ
  
  fx_list (:ov_conn_rabbitmq_list) {
    opts LIST_EXTENDEDSELECT|STD_LAYOUT
    
    instance { |list|
      list.appendItem "rubyneat.c1"
      list.appendItem "rubyneat.tellin"
      list.appendItem "rubyneat.secret"
    }
  }
}
