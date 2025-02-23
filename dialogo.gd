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

extends Control

var dialog = [
	'Hola! Soy Linuka, encantada!'
]

var dialog_index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if dialog_index < dialog.size():
			$Diálogo/Label.text=dialog[dialog_index]
			$Diálogo/Label.percent
	pass
