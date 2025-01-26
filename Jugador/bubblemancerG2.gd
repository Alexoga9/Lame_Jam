extends CharacterBody2D

@onready var animacion = %Animacion
@onready var Anim = $Animacion/AnimationPlayer

@export var vida_maxima: int = 10
var vida_actual: int = vida_maxima

@export var velocidad: float
@export var salto: float
@export var flotabilidad: float
@export var salto_burbijoide: float

var gravedad = ProjectSettings.get_setting("physics/2d/default_gravity")
var modo_burbuja = false


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
	if Input.is_action_just_pressed("saltar") and is_on_floor() and not modo_burbuja:
		velocity.y = salto
	elif Input.is_action_just_pressed("saltar") and is_on_floor() and modo_burbuja:
		velocity.y = salto_burbijoide
	
	if not is_on_floor() and modo_burbuja== true:
		velocity.y += flotabilidad * delta
		velocity.y += (gravedad * delta)/30

	else:
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
		modo_burbuja = true
		animacion.play("Bubble")
		Anim.play("Float")
	else:
		modo_burbuja = false

#Funciones sitema de vida

# Función para establecer la vida máxima
func establecer_vida_maxima(nueva_vida_maxima: int):
	vida_maxima = max(nueva_vida_maxima, 1)  # La vida máxima debe ser al menos 1
	vida_actual = min(vida_actual, vida_maxima)  # Asegúrate de que la vida actual no supere la nueva vida máxima

# Función para recibir daño
func recibir_daño(cantidad: int):
	if not esta_vivo():
		return
	vida_actual -= max(cantidad, 0)  # Reduce la vida, pero evita valores negativos
	vida_actual = max(vida_actual, 0)  # Asegúrate de que no sea menor a 0
	print("Vida actual:", vida_actual)

# Función para recuperar vida
func recuperar_vida(cantidad: int):
	vida_actual += max(cantidad, 0)  # Incrementa la vida, pero evita valores negativos
	vida_actual = min(vida_actual, vida_maxima)  # Asegúrate de que no exceda la vida máxima
	print("Vida actual:", vida_actual)

# Función para verificar si el personaje está vivo
func esta_vivo() -> bool:
	return vida_actual > 0

# Función para verificar la vida y eliminar al personaje si está muerto
func verificar_y_eliminar():
	if not esta_vivo() and not null:
		print("El personaje ha muerto...")
		queue_free()
