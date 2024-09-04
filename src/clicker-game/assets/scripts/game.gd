extends Node

var resource: int = 0
var resource_name = "Pulses"

var upgrade_1_price = 10
var upgrade_2_price = 20

var upgrade_1_x_price = 1.1
var upgrade_2_x_price = 1.5

var upgrade_1_level = 0
var upgrade_2_level = 0

# REFERENCES
@onready var l_resource = $UI/Resource/Resource
@onready var l_resource_amount = $"UI/Resource/Resource Amount"
@onready var l_level_1 = $"UI/Upgrades/Upgrade 1"
@onready var l_level_2 = $"UI/Upgrades/Upgrade 2"
@onready var l_price_1 = $"UI/Upgrades/Upgrade 1/Upgrade 1 price"
@onready var l_price_2 = $"UI/Upgrades/Upgrade 2/Upgrade 2 price"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	l_resource.text = resource_name + ":"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _click_button() -> void:
	print("Resource: " + str(resource))
	resource += 1
	l_resource_amount.text = str(resource)

func _upgrade_1_button() -> void:
	if resource >= upgrade_1_price:
		resource -= upgrade_1_price
		upgrade_1_level += 1
		upgrade_1_price = upgrade_1_price * upgrade_1_x_price
		l_level_1.text = str(upgrade_1_level)
		l_price_1.text = str(upgrade_1_price)
		l_resource_amount.text = str(resource)
	
func _upgrade_2_button() -> void:
	if resource >= upgrade_2_price:
		resource -= upgrade_2_price
		upgrade_2_level += 1
		upgrade_2_price = upgrade_2_price * upgrade_2_x_price
		l_level_2.text = str(upgrade_2_level)
		l_price_2.text = str(upgrade_2_price)
		l_resource_amount.text = str(resource)
