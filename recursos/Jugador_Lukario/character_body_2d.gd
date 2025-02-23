extends CharacterBody2D

@export var interaction_key := "interact"  # Usa la acción "interact" (ESPACIO)
@onready var dialog_box = $Control
@onready var dialog_label = $Control/Label

var player_near = false
var player = null

func _ready():
	$Area2D.connect("body_entered", _on_body_entered)
	$Area2D.connect("body_exited", _on_body_exited)

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_near = true
		player = body

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_near = false
		player = null

func _input(event):
	if player_near and event.is_action_pressed(interaction_key):
		if get_parent().name == "printf":
			DialogueManager.show_dialogue_balloon(load("res://dialogue.dialogue"),"printf_charla")
		elif get_parent().name == "scanf":
			DialogueManager.show_dialogue_balloon(load("res://dialogue.dialogue"),"scanf_charla")
		elif get_parent().name == "if":
			DialogueManager.show_dialogue_balloon(load("res://dialogue.dialogue"),"if_charla")	
		elif get_parent().name == "for":
			DialogueManager.show_dialogue_balloon(load("res://dialogue.dialogue"),"for_charla")
		elif get_parent().name == "windows":
			DialogueManager.show_dialogue_balloon(load("res://dialogue.dialogue"),"windows_charla")
		elif get_parent().name == "Lukario":
			DialogueManager.show_dialogue_balloon(load("res://dialogue.dialogue"),"puerta")	
