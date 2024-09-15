extends Node


func _ready():
	print("State = " + str(Global.state) + " , Load: Main")
	_on_button_pressed() # delete: show this menu

func _on_button_pressed() -> void:
	# Code to execute when the button is pressed
	print("button pressed")
	Global.state += 1
	Global.already_created = false
	#get_tree().root.add_child(game)
	#ui.visible = false
