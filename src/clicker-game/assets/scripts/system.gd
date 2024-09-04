extends Node

var intro = preload("res://scns/intro.tscn").instantiate()
var main = preload("res://scns/main.tscn").instantiate()
var game = preload("res://scns/game.tscn").instantiate()

var timer = 3.0
var state = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_load_intro()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if state == 0:
		if timer <= 0: 
			state = 1
			_load_main()
		else:
			timer -= delta

func _load_intro():
	get_tree().root.add_child(intro)
	
func _load_main():
	get_tree().root.remove_child(intro)
	get_tree().root.add_child(main)
