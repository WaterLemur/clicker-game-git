extends Control

@onready var logo =    $Logo
@onready var company = $Company
@onready var dev =     $Dev

var timer = 1.5
var alpha = 0.0
var stage = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	logo.set_modulate(Color(1,1,1,0))
	company.set_modulate(Color(1,1,1,0))
	dev.set_modulate(Color(1,1,1,0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	fade(delta)


func _set_alpha(a: float) -> void:
	logo.set_modulate(Color(1,1,1,a))
	company.set_modulate(Color(1,1,1,a))
	dev.set_modulate(Color(1,1,1,a))
	
	
func fade(delta: float) -> void:
	if stage == false:
		alpha += 0.75 * delta
		_set_alpha(alpha)
		if alpha > 1:
			stage = true
	else:
		alpha -= 1.30 * delta
		_set_alpha(alpha)
		if alpha < 0:
			Global.state += 1
			Global.already_created = false
