extends Node

var clicks: int = 0

var upgrade_1_price = 10
var upgrade_2_price = 20

var upgrade_1_x_price = 1.1
var upgrade_2_x_price = 1.5

var upgrade_1_level = 0
var upgrade_2_level = 0

# REFERENCES
@onready var l_resource = $"HUD/Resource/Click Number"
@onready var l_level_1 = $"HUD/Upgrades/Upgrade 1"
@onready var l_level_2 = $"HUD/Upgrades/Upgrade 2"
@onready var l_price_1 = $"HUD/Upgrades/Upgrade 1/Upgrade 1 price"
@onready var l_price_2 = $"HUD/Upgrades/Upgrade 2/Upgrade 2 price"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _click_button() -> void:
	clicks = clicks + 1
	l_resource.text = str(clicks)
	print(clicks)

func _upgrade_1_button() -> void:
	if clicks >= upgrade_1_price:
		clicks -= upgrade_1_price
		upgrade_1_level += 1
		upgrade_1_price = upgrade_1_price * upgrade_1_x_price
		l_level_1.text = str(upgrade_1_level)
		l_price_1.text = str(upgrade_1_price)
		l_resource.text = str(clicks)
	
func _upgrade_2_button() -> void:
	if clicks >= upgrade_2_price:
		clicks -= upgrade_2_price
		upgrade_2_level += 1
		upgrade_2_price = upgrade_2_price * upgrade_2_x_price
		l_level_2.text = str(upgrade_2_level)
		l_price_2.text = str(upgrade_2_price)
		l_resource.text = str(clicks)
