extends Node

var pausa = true


func _physics_process(delta):
	if Input.is_action_just_pressed("Escape"):
		pausa = !pausa
		Engine.time_scale = pausa
		self.visible = !pausa
