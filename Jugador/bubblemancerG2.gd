extends CharacterBody2D

@onready var animacion = %Animacion
@onready var Anim = $Animacion/AnimationPlayer

@export var velocidad: float
@export var salto: float

var gravedad = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	mover_x()
	girar_personaje_al_moverse()
	saltar(delta)
	actualizacion_de_animaciones()
	cambio_de_skin()
	
	move_and_slide()


func mover_x():
	var input_axis = Input.get_axis("mover_izquierda", "mover_derecha")
	velocity.x = input_axis * velocidad


func girar_personaje_al_moverse():
	if (velocity.x < 0) :
		animacion.flip_h = true
	elif (velocity.x > 0): animacion.flip_h = false


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
		Anim.play("Walk")
	else:
		animacion.play("Idle")
		Anim.stop()

func cambio_de_skin():
	if Input.is_action_pressed("mover_arriba"):
		animacion.play("Bubble")
		Anim.play("Float")
