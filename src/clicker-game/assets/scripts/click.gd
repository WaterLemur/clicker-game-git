extends RayCast3D

@onready var raycast = $"."
@onready var clickable_object = $"../Heart"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if raycast.is_colliding():
		# Check if the intersected body is the clickable object
		if raycast.get_collider() == clickable_object:
			print("Clickable object hit!")
			# Trigger your desired action here
