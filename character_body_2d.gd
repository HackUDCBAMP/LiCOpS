extends CharacterBody2D

@export var interaction_key := "interact"  # Usa la acción "interact" (ESPACIO)
@onready var dialog_box = $Control
@onready var dialog_label = $Control/Label

var player_near = false
var player = null

func _ready():
	$Area2D.connect("body_entered", _on_body_entered)
	$Area2D.connect("body_exited", _on_body_exited)
	dialog_box.visible = false  # Ocultar diálogo al inicio

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_near = true
		player = body

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_near = false
		player = null
		hide_dialog()

func _input(event):
	if player_near and event.is_action_pressed(interaction_key):
		toggle_dialog()

func toggle_dialog():
	if dialog_box.visible:
		hide_dialog()
	else:
		show_dialog()

func show_dialog():
	dialog_label.text = "Hola"  # Texto del diálogo
	dialog_box.visible = true

func hide_dialog():
	dialog_box.visible = false
