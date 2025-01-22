extends CharacterBody2D

@onready var animacion = %Animacion

@export var velocidad: float
@export var salto: float

var mirando_derecha = true
var gravedad = ProjectSettings.get_setting("physics/2d/default_gravity")
var textura2 = preload("res://Jugador/Bubble_sheet.tres")

func _physics_process(delta):
	mover_x()
	girar_personaje_al_moverse()
	saltar(delta)
	actualizacion_de_animaciones()
	
	cambio()
	
	move_and_slide()


func mover_x():
	var input_axis = Input.get_axis("mover_izquierda", "mover_derecha")
	velocity.x = input_axis * velocidad


func girar_personaje_al_moverse():
	if (mirando_derecha and velocity.x < 0) or (not mirando_derecha and velocity.x > 0):
		scale.x *= -1
		mirando_derecha = not mirando_derecha


func saltar(delta):
	if Input.is_action_just_pressed("saltar") and is_on_floor():
		velocity.y = salto
	
	if not is_on_floor():
		velocity.y += gravedad * delta


func actualizacion_de_animaciones():
	if not is_on_floor():
		if velocity.y <0:
			animacion.play("Saltar")
		else:
			animacion.play("Caida")
		return
	
	if velocity.x:
		animacion.play("Caminar")
	else:
		animacion.play("Idle")

func cambio():
	if Input.is_action_pressed("mover_arriba"):
		%Animacion.sprite_frames = textura2
