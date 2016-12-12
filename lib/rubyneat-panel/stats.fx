# Stats tab

fx_tab_item { text "&Stats" }
fx_horizontal_frame { opts STD_FRAME }

fx_menu_pane {
  fx_menu_command { text "Something Special"; selector FXTabBar::ID_OPEN_FIRST+0 }
  fx_menu_command { text "Not So Special"; selector FXTabBar::ID_OPEN_FIRST+1 }
}
