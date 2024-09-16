extends Node

@onready var intro = preload("res://scns/intro.tscn").instantiate()
@onready var main = preload("res://scns/main.tscn").instantiate()
@onready var game = preload("res://scns/game.tscn").instantiate()

var timer = 10.0 #1.69


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_load_intro()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	scene_states()


func scene_states():
	match Global.state:
		0:
			if Global.already_created == false:
				Global.already_created = true
				_load_intro()
		1: 			
			if Global.already_created == false:
				Global.already_created = true
				_load_main()
		2:			
			if Global.already_created == false:
				Global.already_created = true
				_load_game()
				
	
func _load_intro():
	add_child(intro)

	
func _load_main():
	remove_child(game)
	remove_child(intro)
	add_child(main)
	
func _load_game():
	remove_child(main)
	add_child(game)
