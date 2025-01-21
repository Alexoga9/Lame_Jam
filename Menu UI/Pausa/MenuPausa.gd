extends Control

var pausa = true


func _physics_process(_delta):
	pausar()
	escape()


func pausar():
		Engine.time_scale = pausa
		self.visible = !pausa


func escape():
	if Input.is_action_just_pressed("Escape"):
		pausa = !pausa


func _on_continuar_pressed():
	pausa = !pausa


func _on_salir_al_menu_pressed():
	get_tree().change_scene_to_file("res://Menu UI/Menu Principal/menu_principal.tscn")
