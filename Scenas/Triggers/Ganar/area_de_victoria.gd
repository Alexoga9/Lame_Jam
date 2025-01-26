extends Area2D

@export var pantalla : Control

func _on_body_entered(_body):
	pantalla.visible = true
	pausar()

func pausar():
		Engine.time_scale = false
