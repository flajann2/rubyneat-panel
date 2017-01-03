fx_group_box {
  text "Details"
  opts STD_GROUPBOX_HORIZ
  fx_text (:ov_conn_neater_details) {
    opts ICONLIST_EXTENDEDSELECT|STD_LAYOUT
    instance { |t|
      t.editable = false
    }
  }
}
