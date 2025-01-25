extends Control

@export_file() var siguiente_nivel
# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_siguiente_nivel_pressed():
	get_tree().change_scene_to_file(siguiente_nivel)


func _on_menu_principal_pressed():
	get_tree().change_scene_to_file("res://Menu UI/Menu Principal/menu_principal.tscn")
