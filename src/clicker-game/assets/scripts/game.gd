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
@onready var l_level_1 = $"Upgrades2/Upgrade 1"
@onready var l_level_2 = $"Upgrades2/Upgrade 2"
@onready var l_price_1 = $"Upgrades2/Upgrade 1/Upgrade 1 price"
@onready var l_price_2 = $"Upgrades2/Upgrade 2/Upgrade 2 price"

@onready var img_brain = $Upgrades/Brain
@onready var img_eye = $Upgrades/Eye
@onready var img_lungs = $Upgrades/Lungs
@onready var img_rib_cage = $"Upgrades/Rib Cage"

@onready var btn_brain = $"Main buttons/Button Brain"
@onready var btn_eye = $"Main buttons/Button Eye"
@onready var btn_lungs = $"Main buttons/Button Lungs"
@onready var btn_rib_cage = $"Main buttons/Button Rib Cage"

@onready var btn_upgrade_1 = $"Upgrades2/Button Upgrade 1"
@onready var btn_upgrade_2 = $"Upgrades2/Button Upgrade 2"

var color_btn_off = Color(1,0,0,1)
var color_btn_on = Color(0,1,0,1)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	l_resource.text = resource_name + ":"
	
	img_brain.visible = false
	img_eye.visible = false
	img_lungs.visible = false
	img_rib_cage.visible = false
	
	btn_brain.set_modulate(color_btn_off)
	btn_eye.set_modulate(color_btn_off)
	btn_lungs.set_modulate(color_btn_off)
	btn_rib_cage.set_modulate(color_btn_off)
	btn_upgrade_1.set_modulate(color_btn_off)
	btn_upgrade_2.set_modulate(color_btn_off)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


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


func _on_click_pressed() -> void:
	print("Resource: " + str(resource))
	resource += 1
	l_resource_amount.text = str(resource)

func _on_button_brain_pressed() -> void:
	img_brain.visible = true
	btn_brain.set_modulate(color_btn_on)
func _on_button_eye_pressed() -> void:
	img_eye.visible = true
	btn_eye.set_modulate(color_btn_on)
func _on_button_lungs_pressed() -> void:
	img_lungs.visible = true
	btn_lungs.set_modulate(color_btn_on)
func _on_button_rib_cage_pressed() -> void:
	img_rib_cage.visible = true
	btn_rib_cage.set_modulate(color_btn_on)
