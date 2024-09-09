extends Node

var intro = preload("res://scns/intro.tscn").instantiate()
var main = preload("res://scns/main.tscn").instantiate()
var game = preload("res://scns/game.tscn").instantiate()

var timer = 10.0 #1.69


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_load_intro()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scene_states()


func scene_states():
	match Global.state:
		0:
			if Global.already_created == false:
				_load_intro()
				Global.already_created = true
		1: 			
			if Global.already_created == false:
				_load_main()
				Global.already_created = true
		2:			
			if Global.already_created == false:
				_load_game()
				Global.already_created = true
	
func _load_intro():
	print("Load: Intro")
	add_child(intro)

	
func _load_main():
	print("Load: Main")
	remove_child(intro)
	add_child(main)
	
func _load_game():
	print("Load: Game")
	remove_child(main)
	add_child(game)
