# Este archivo es parte de LiCOpS.
#
# LiCOpS es software libre: puede redistribuirlo y/o 
# modificarlo bajo los términos de la Licencia Pública General de GNU 
# publicada por la Free Software Foundation, ya sea la versión 3 
# de la Licencia, o (a su elección) cualquier versión posterior.
#
# LiCOpS se distribuye SIN GARANTÍA ALGUNA; ni siquiera 
# la garantía implícita de COMERCIALIZACIÓN o IDONEIDAD PARA UN 
# PROPÓSITO PARTICULAR. 
# Consulte la Licencia Pública General de GNU para más detalles.
#
# Debería haber recibido una copia de la Licencia Pública General 
# de GNU junto con este programa. 
# En caso contrario, consulte <http://www.gnu.org/licenses/>.

extends CharacterBody2D

@export var speed: float = 2.5
const TILE_SIZE = 320

@onready var anim_tree = $AnimationTree
@onready var anim_state = anim_tree.get("parameters/playback")


var init_position = Vector2(0,0)
var input_direction = Vector2(0,0)
var is_moving = false
var next_tile_percent = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("player")
	init_position = position
	pass # Replace with function body.

func process_input() -> void:
	if input_direction.y == 0:
		input_direction.x = int(Input.is_action_pressed("derecha")) - int(Input.is_action_pressed("izquierda"))
	if input_direction.x == 0:
		input_direction.y = int(Input.is_action_pressed("abajo")) - int(Input.is_action_pressed("arriba"))

	# Si hay alguna dirección distinta de (0,0), empezamos a movernos
	if input_direction != Vector2.ZERO:
		anim_tree.set("parameters/Idle/blend_position", input_direction)
		anim_tree.set("parameters/Walk/blend_position", input_direction)
		
		init_position = position
		is_moving = true
	else:
		anim_state.travel("Idle")

func move(delta) -> void:
	# Pequeño desplazamiento que toca avanzar en esta frame
	var motion = (TILE_SIZE * input_direction) * (speed * delta)
	
	# Intenta moverte con colisión
	var collision = move_and_collide(motion)
	
	if collision:
		# Si hay colisión, paramos del todo
		is_moving = false
		next_tile_percent = 0.0
	else:
		# Si no hubo colisión, seguimos acumulando cuánto llevamos recorrido en esta "casilla"
		next_tile_percent += speed * delta
		
		# Cuando llegue o pase de 1.0, ya hemos avanzado lo suficiente para completar la casilla
		if next_tile_percent >= 1.0:
			# Ajustamos posición exacta a la celda destino y reiniciamos
			position = init_position + (TILE_SIZE * input_direction)
			is_moving = false
			next_tile_percent = 0.0


func _physics_process(delta):
	 # Revisa primero si estás en medio del movimiento
	if is_moving:
		# Mientras estás moviendo, viaja a la animación de caminar
		anim_state.travel("Walk")
		
		# Aquí actualizas la blend_position de la animación
		anim_tree.set("parameters/Walk/blend_position", input_direction)
		anim_tree.set("parameters/Idle/blend_position", input_direction)

		move(delta)
	else:
		# Si no estás en movimiento, se procesa la nueva entrada
		process_input()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
