extends Node2D


@export var vida_maxima: int = 10
var vida_actual: int = vida_maxima


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
