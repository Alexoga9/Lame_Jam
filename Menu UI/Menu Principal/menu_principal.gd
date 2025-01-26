extends Control


func _on_jugar_pressed():
	get_tree().change_scene_to_file("res://Scenas/Niveles/lv_1.tscn")


func _on_opciones_pressed():
	%Opciones.visible = true


func _on_atras_pressed():
	%Opciones.visible = false


func _on_atras_resolucion_pressed():
	%Resolucion.visible = false


func _on_resolucion_pressed():
	%Resolucion.visible = true


func _on_resoluciones_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		1:
			DisplayServer.window_set_size(Vector2i(1600,900))
		2:
			DisplayServer.window_set_size(Vector2i(1280,720))


func _on_volumen_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)


func _on_sonido_pressed():
	%Sonido.visible = true


func _on_atras_sonido_pressed():
	%Sonido.visible = false


func _on_salir_pressed():
	get_tree().quit()


func _on_modo_de_pantalla_elegir_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
		2:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _on_borderless_elegir_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
	if !toggled_on:
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
