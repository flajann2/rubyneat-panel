# coding: utf-8
fx_group_box {
  text "Details"
  opts STD_GROUPBOX_HORIZ
  fx_text (:ov_conn_neater_details) {
    opts ICONLIST_EXTENDEDSELECT|STD_LAYOUT
    instance { |t|
      t.editable = false
    }
  }
  
  ingress_handler(:details) { |type, cmd|
    suc, details = cmd.response
    detail_box = ref :ov_conn_neater_details
    case suc
    when :success
      detail_box.backColor = FXColor::LightSeaGreen
      detail_box.text = details.to_yaml
    when :fail
      detail_box.backColor = FXColor::LightPink
      detail_box.text = details
    end
  }
}
