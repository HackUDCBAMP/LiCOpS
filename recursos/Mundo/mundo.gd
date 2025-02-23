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

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.show_dialogue_balloon(load("res://dialogue.dialogue"),"start")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
