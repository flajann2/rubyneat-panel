fx_group_box (:ov_conn_rabbitmq_details) {
  text "Details"
  opts  CLEAN_GROUPBOX | LAYOUT_FILL_ROW
  fx_vertical_frame {
    opts STD_LAYOUT
    fx_matrix {
      n 2
      opts MATRIX_BY_COLUMNS|LAYOUT_FILL_ROW
      NCOLS=40
      
      fx_label { text "AMQP URL" }
      fx_text_field (:ov_conn_rabbit_url) {
        opts LAYOUT_CENTER_X
        ncols NCOLS
        instance { |t| t.text = Panel.opts[:url] }
      }
      
      fx_label { text "Queue" }
      fx_text_field (:ov_conn_rabbit_queue) {
        opts LAYOUT_CENTER_X
        ncols NCOLS
        instance { |t| t.text = Panel.opts[:queue] }
      }
      
      fx_label { text "Routing" }
      fx_text_field (:ov_conn_rabbit_routing) {
        opts LAYOUT_CENTER_X
        ncols NCOLS
        instance { |t| t.text = Panel.opts[:routing] }
      }
      
      fx_label { text "Reply" }
      fx_text_field (:ov_conn_rabbit_reply) {
        opts LAYOUT_CENTER_X
        ncols NCOLS
        instance { |t| t.text = Panel.opts[:reply] }
      }
    }
    
    fx_spring { opts LAYOUT_FILL_Y;  relw 10 }
    
    fx_horizontal_frame {
      opts LAYOUT_CENTER_X
      fx_button (:ov_conn_rabbit_connect) {
        text "CONNECT"
        instance { |b|
          b.sel_command {
            Controller.connect url: fxi(:ov_conn_rabbit_url).text,
                               queue: fxi(:ov_conn_rabbit_queue).text,
                               routing: fxi(:ov_conn_rabbit_routing).text,
                               reply: fxi(:ov_conn_rabbit_reply).text
          }
        }
      }
      
      fx_button (:ov_conn_rabbit_disconnect) {
        text "BREAK"
      }
    }
  }
}
