extends Node

@onready var btn_new = $UI/New
var game = preload("res://scns/game.tscn").instantiate()
#var main = preload("res://scns/main.tscn").instantiate()

func _ready():
	# btn_new.connect("pressed", "_on_new_pressed")
	pass

func _on_button_pressed() -> void:
	# Code to execute when the button is pressed
	print("Load: Game")
	get_tree().root.add_child(game)
	get_tree().root.remove_child(self)
	$UI.visible = false
