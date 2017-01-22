fx_chart (:neater_evolution_chart) {
  opts STD_LAYOUT|FRAME_LINE
  
  instance{ |c|
    c.sel_paint { |sender, sel, event|
      FXDCWindow.new(sender, event) { |dc|
        ap ref(:back_buffer)
        dc.drawImage(ref(:back_buffer), 0, 0)
      }
    }

    #c.sel_configure { |sender, sel, event|
    #  bb = ref(:back_buffer)
    #  bb.create unless bb.created?
    #  bb.resize(sender.width, sender.height)
    #  ref(:bounce_window) do |bw|
    #    bw.ball.setWorldSize(sender.width, sender.height)
    #    bw.drawScene(bb)
    #  end
    #}
  }
}
