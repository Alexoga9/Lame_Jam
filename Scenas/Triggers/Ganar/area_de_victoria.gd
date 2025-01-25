extends Area2D

@export var pantalla : Control

func _on_body_entered(body):
	print("Ganaste :D")
	print (body.name)
	pantalla.visible = true
