extends Node
	
# CONSTANTS ------------------------------------------------------------------
# VARIABLES ------------------------------------------------------------------
var total_clicks: int = 0
	
var resource_name: String = "Pulses"
var resource: int = 0
var resource_multiplier: float = 1.0
	
var price_brain: int = 20
var price_eye: int = 10
var price_lungs: int = 5
var price_rib_cage: int = 15
	
var x_price_brain: float = 2.0
var x_price_eye: float = 1.33
var x_price_lungs: float = 3.5
var x_price_rib_cage: float = 1.5
	
var lvl_brain: int = 0
var lvl_eye: int = 0
var lvl_lungs: int = 0
var lvl_rib_cage: int = 0
	
# REFERENCES -----------------------------------------------------------------
#Labels ----------------------------------------------------------------------
@onready var l_clicks = $"UI/RESOURCE/L Resource/L Resource Var"
	
#day/night cycle variables
	
@onready var l_resource: Label = $"UI/RESOURCE/L Resource"
@onready var l_resource_amount: Label = $"UI/RESOURCE/L Resource/L Resource Var"
	
@onready var l_lvl_brain: Label = $"UI/MENU/STORES/MAIN STORE/BRAIN/Lvl Brain Var"
@onready var l_lvl_eye: Label = $"UI/MENU/STORES/MAIN STORE/EYE/Lvl Eye Var"
@onready var l_lvl_lungs: Label = $"UI/MENU/STORES/MAIN STORE/LUNGS/Lvl Lungs Var"
@onready var l_lvl_rib_cage: Label = $"UI/MENU/STORES/MAIN STORE/RIB CAGE/Lvl Rib Cage Var"
	
@onready var l_brain: Label = $"UI/MENU/STORES/MAIN STORE/BRAIN/Lvl Brain Var/L Brain"
@onready var l_eye: Label = $"UI/MENU/STORES/MAIN STORE/EYE/Lvl Eye Var/L Eye"
@onready var l_lungs: Label = $"UI/MENU/STORES/MAIN STORE/LUNGS/Lvl Lungs Var/L Lungs"
@onready var l_rib_cage: Label = $"UI/MENU/STORES/MAIN STORE/RIB CAGE/Lvl Rib Cage Var/L Rib Cage"
	
@onready var l_price_brain: Label = $"UI/MENU/STORES/MAIN STORE/BRAIN/Lvl Brain Var/L Brain/L Price Brain Var"
@onready var l_price_eye: Label = $"UI/MENU/STORES/MAIN STORE/EYE/Lvl Eye Var/L Eye/L Price Eye Var"
@onready var l_price_lungs: Label = $"UI/MENU/STORES/MAIN STORE/LUNGS/Lvl Lungs Var/L Lungs/L Price Lungs Var"
@onready var l_price_rib_cage: Label = $"UI/MENU/STORES/MAIN STORE/RIB CAGE/Lvl Rib Cage Var/L Rib Cage/L Price Rib Cage Var"
	
@onready var l_x_price_brain: Label = $"UI/MENU/STORES/MAIN STORE/BRAIN/Lvl Brain Var/L Brain/L Price Brain Var/L X-Price Brain Var"
@onready var l_x_price_eye: Label = $"UI/MENU/STORES/MAIN STORE/EYE/Lvl Eye Var/L Eye/L Price Eye Var/L X-Price Eye Var"
@onready var l_x_price_lungs: Label = $"UI/MENU/STORES/MAIN STORE/LUNGS/Lvl Lungs Var/L Lungs/L Price Lungs Var/L X-Price Lungs Var"
@onready var l_x_price_rib_cage: Label = $"UI/MENU/STORES/MAIN STORE/RIB CAGE/Lvl Rib Cage Var/L Rib Cage/L Price Rib Cage Var/L X-Price Rib Cage Var"
	
#Sprite2D --------------------------------------------------------------------
@onready var img_brain: Sprite2D = $Graphics/Brain
@onready var img_eye: Sprite2D = $Graphics/Eye
@onready var img_lungs: Node2D = $Graphics/Lungs
@onready var img_rib_cage: Sprite2D = $"Graphics/Rib Cage"
	
# Buttons --------------------------------------------------------------------
@onready var btn_brain: Button = $"UI/Main buttons/Button Brain"
@onready var btn_eye: Button = $"UI/Main buttons/Button Eye"
@onready var btn_lungs: Button = $"UI/Main buttons/Button Lungs"
@onready var btn_rib_cage: Button = $"UI/Main buttons/Button Rib Cage"
	
#MAIN STORE
@onready var btn_upg_brain: Button = $"UI/MENU/STORES/MAIN STORE/BRAIN/Lvl Brain Var/L Brain/L Price Brain Var/Btn Upg Brain"
@onready var btn_upg_eye: Button = $"UI/MENU/STORES/MAIN STORE/EYE/Lvl Eye Var/L Eye/L Price Eye Var/L X-Price Eye Var/Btn Upg Eye"
@onready var btn_upg_lungs: Button = $"UI/MENU/STORES/MAIN STORE/LUNGS/Lvl Lungs Var/L Lungs/L Price Lungs Var/L X-Price Lungs Var/Btn Upg Lungs"
@onready var btn_upg_rib_cage: Button = $"UI/MENU/STORES/MAIN STORE/RIB CAGE/Lvl Rib Cage Var/L Rib Cage/L Price Rib Cage Var/L X-Price Rib Cage Var/Btn Upg Rib Cage"
	
var btn_array = [ btn_brain, btn_eye, btn_lungs, btn_rib_cage ]
# Colors ---------------------------------------------------------------------
var col_transparent: Color = Color(0,0,0,0)
var col_visible: Color = Color (1,1,1,1)
	
var col_red: Color = Color(1,0,0,1)
var col_green: Color = Color(0,1,0,1)
var col_blue: Color = Color(0,0,1,1)
var col_yellow: Color = Color (1,1,0,1)
	
# FUNCTIONS ------------------------------------------------------------------
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("State = " + str(Global.state) + " , Load: Game")
	
	l_resource.text = resource_name + ":"
	l_resource_amount.text = "0"
	
	img_brain.set_modulate(col_transparent)
	img_eye.set_modulate(col_transparent)
	img_lungs.set_modulate(col_transparent)
	img_rib_cage.set_modulate(col_transparent)
	
	btn_brain.set_modulate(col_red)
	btn_eye.set_modulate(col_red)
	btn_lungs.set_modulate(col_red)
	btn_rib_cage.set_modulate(col_red)
	
	_color_store_brain(col_red)
	_color_store_eye(col_red)
	_color_store_lungs(col_red)
	_color_store_rib_cage(col_red)
	
	l_price_brain.text = str(price_brain)
	l_price_eye.text = str(price_eye)
	l_price_lungs.text = str(price_lungs)
	l_price_rib_cage.text = str(price_rib_cage)
	
	l_x_price_brain.text = str(x_price_brain)
	l_x_price_eye.text = str(x_price_eye)
	l_x_price_lungs.text = str(x_price_lungs)
	l_x_price_rib_cage.text = str(x_price_rib_cage)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
# ASSIGN COLORS --------------------------------------------------------------
func _color_store_brain(new_col: Color) -> void:
	l_brain.set_modulate(new_col)
	l_lvl_brain.set_modulate(new_col)
	l_x_price_brain.set_modulate(new_col)
	btn_upg_brain.set_modulate(new_col)
	
	btn_brain.set_modulate(new_col)
	
func _color_store_eye(new_col: Color) -> void:
	l_eye.set_modulate(new_col)
	l_lvl_eye.set_modulate(new_col)
	l_x_price_eye.set_modulate(new_col)
	btn_upg_eye.set_modulate(new_col)
	
	btn_eye.set_modulate(new_col)
	
func _color_store_lungs(new_col: Color) -> void:
	l_lungs.set_modulate(new_col)
	l_lvl_lungs.set_modulate(new_col)
	l_x_price_lungs.set_modulate(new_col)
	btn_upg_lungs.set_modulate(new_col)
	
	btn_lungs.set_modulate(new_col)
	
func _color_store_rib_cage(new_col: Color) -> void:
	l_rib_cage.set_modulate(new_col)
	l_lvl_rib_cage.set_modulate(new_col)
	l_x_price_rib_cage.set_modulate(new_col)
	btn_upg_rib_cage.set_modulate(new_col)
	
	btn_rib_cage.set_modulate(new_col)
	
	
# BUTTON PRESS ----------------------------------------------------------------
func _on_click_pressed() -> void:
	total_clicks += 1
	resource += 1 * resource_multiplier
	print("Clicks: " + str(total_clicks) + " ... Resource: " + str(resource))
	l_resource_amount.text = str(resource)
	
	# Check color clicked yellow ---------------------------------------------
	if resource >= price_brain:
		_color_store_brain(col_yellow)
	if resource >= price_eye:
		_color_store_eye(col_yellow)
	if resource >= price_lungs:
		_color_store_lungs(col_yellow)
	if resource >= price_rib_cage:
		_color_store_rib_cage(col_yellow)

	
func _check_store_color_red() -> void:
	if resource < price_brain: _color_store_brain(col_red)
	if resource < price_eye: _color_store_eye(col_red)
	if resource < price_lungs: _color_store_lungs(col_red)
	if resource < price_rib_cage: _color_store_rib_cage(col_red)
	
	if resource < price_brain: btn_brain.set_modulate(col_red)
	
	
func _check_store_color_blue() -> void:
	if lvl_brain != 0: btn_brain.set_modulate(col_blue)
	if lvl_eye != 0: btn_eye.set_modulate(col_blue)
	if lvl_lungs != 0: btn_lungs.set_modulate(col_blue)
	if lvl_rib_cage != 0: btn_rib_cage.set_modulate(col_blue)
	
	if resource < price_brain: btn_brain.set_modulate(col_blue)
	
	
func _on_button_brain_pressed() -> void:
	if lvl_brain == 0:
		pass
	elif lvl_brain > 0:
		btn_brain.set_modulate(col_green)
	
func _on_button_eye_pressed() -> void:
	if lvl_eye == 0:
		pass
	elif lvl_eye > 0:
		btn_eye.set_modulate(col_green)
func _on_button_lungs_pressed() -> void:
	if lvl_lungs == 0:
		pass
	elif lvl_lungs > 0:
		btn_lungs.set_modulate(col_green)
func _on_button_rib_cage_pressed() -> void:
	if lvl_rib_cage == 0:
		pass
	elif lvl_rib_cage > 0:
		btn_rib_cage.set_modulate(col_green)
	
	
func _on_btn_upg_brain_pressed() -> void:
	if resource >= price_brain:
		if lvl_brain == 0:
			img_brain.set_modulate(col_visible)
			
		lvl_brain += 1
		resource -= price_brain
		_check_store_color_red()
		price_brain *= x_price_brain
		
		l_lvl_brain.text = str(lvl_brain)
		l_price_brain.text = str("%.2f" % price_brain)
		l_resource_amount.text = str(resource)
	
func _on_btn_upg_eye_pressed() -> void:
	if resource >= price_eye:
		if lvl_eye == 0:
			btn_eye.set_modulate(col_blue)
			
		lvl_eye += 1
		resource -= price_eye
		_check_store_color_red()
		price_eye *= x_price_eye
		
		l_lvl_eye.text = str(lvl_eye)
		l_price_eye.text = str("%.2f" % price_eye)
		l_resource_amount.text = str(resource)
	
	
func _on_btn_upg_lungs_pressed() -> void:
	if resource >= price_lungs:
		if lvl_lungs == 0:
			btn_lungs.set_modulate(col_blue)
			
		lvl_lungs += 1
		resource -= price_lungs
		_check_store_color_red()
		price_lungs *= x_price_lungs
		
		l_lvl_lungs.text = str(lvl_lungs)
		l_price_lungs.text = str("%.2f" % price_lungs)
		l_resource_amount.text = str(resource)
	
	
func _on_btn_upg_rib_cage_pressed() -> void:
	if resource >= price_rib_cage:
		if lvl_rib_cage == 0:
			btn_rib_cage.set_modulate(col_blue)
			
		lvl_rib_cage += 1
		resource -= price_rib_cage
		_check_store_color_red()
		price_rib_cage *= x_price_rib_cage
		
		l_lvl_rib_cage.text = str(lvl_rib_cage)
		l_price_rib_cage.text = str("%.2f" % price_rib_cage)
		l_resource_amount.text = str(resource)
	
