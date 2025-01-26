extends Area2D

var personaje_scene = load("res://Jugador/bubblemancerG2.tscn")



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Jugador"):
		body.recibir_daño(5)
		body.verificar_y_eliminar()
