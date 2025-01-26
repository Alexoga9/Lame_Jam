extends Area2D

@export var impulso_magnitud: float = 200.0


@onready var raycast = $"../RayCast2D"

func _ready():
	if not raycast.enabled:
		raycast.enabled = true

func _on_area_body_entered(body):
	# Verifica el tipo de cuerpo que ha entrado en el área, por si queremos implementarlo a otras cosas
	if body is CharacterBody2D:
		aplicar_impulso_character(body)
	elif body is RigidBody2D:
		aplicar_impulso_rigid(body)

func aplicar_impulso_character(body: CharacterBody2D):
	# Esto calcula la dirección del impulso usando la dirección del RayCast2D
	var impulso_direccion = (raycast.to_global(raycast.target_position) - raycast.global_position).normalized()
	body.velocity += impulso_direccion * impulso_magnitud  # Ajusta la velocidad del CharacterBody2D
	print("Impulso aplicado a CharacterBody2D:", body, "Dirección:", impulso_direccion)

func aplicar_impulso_rigid(body: RigidBody2D):
	# Calcula la dirección del impulso usando la dirección del RayCast2D
	var impulso_direccion = (raycast.to_global(raycast.target_position) - raycast.global_position).normalized()
	body.apply_impulse(Vector2.ZERO, impulso_direccion * impulso_magnitud)  # Aplica el impulso al RigidBody2D
	print("Impulso aplicado a RigidBody2D:", body, "Dirección:", impulso_direccion)
