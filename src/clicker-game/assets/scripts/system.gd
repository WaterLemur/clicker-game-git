extends Node

var intro = preload("res://scns/intro.tscn").instantiate()
var main = preload("res://scns/main.tscn").instantiate()
var game = preload("res://scns/game.tscn").instantiate()

var timer = 0.0
var maxTimer = 3.0
var timerSpeed = 1.0
var state = 0



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = maxTimer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if state == 1:
		return
	if timer <= 0:
		if state > 2:
			state = 0
		else: state += 1
		
		timer = maxTimer
		if state == 0:
			_load_intro()
		elif state == 1:
			_load_main()
		elif state == 2:
			_load_game()
	else: timer -= timerSpeed * delta

func _load_intro():
	get_tree().root.add_child(intro)
	get_tree().root.remove_child(game)
	
func _load_main():
	get_tree().root.add_child(main)
	get_tree().root.remove_child(intro)
	
func _load_game():
	get_tree().root.add_child(game)
	get_tree().root.remove_child(main)
