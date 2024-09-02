extends Node

var intro = preload("res://scns/intro.tscn").instantiate()
var main = preload("res://scns/main.tscn").instantiate()
var game = preload("res://scns/game.tscn").instantiate()

var timer = 3.0
var timerSpeed = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer <= 0:
		_load_intro()
	else: timer -= timerSpeed * delta


func _load_intro():
	get_tree().root.add_child(intro)
	
func _load_main():
	get_tree().root.add_child(main)
	
func _load_game():
	get_tree().root.add_child(game)
	
