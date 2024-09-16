extends Node
	
	
# CONSTANTS ------------------------------------------------------------------
const RESOURCE_NAME: String = "Pulses"
	
# Colors ---------------------------------------------------------------------
const TRANSPARENT: Color = Color(0,0,0,0)
const VISIBLE: Color = Color (1,1,1,1)
	
const RED: Color = Color(1,0,0,1)
const GREEN: Color = Color(0,1,0,1)
const BLUE: Color = Color(0,0,1,1)
const YELLOW: Color = Color (1,1,0,1)
	
# VARIABLES ------------------------------------------------------------------
var total_clicks: int = 0
	
var resource: int = 0
var resource_multiplier: float = 1.0
	
var timer: float = 0.0
var timer_max: float = 1.0
var timer_x: float = 100.0 #10.0
var hours: int = 0
var minutes: int = 0
var day: bool = true
	
var price_brain: int = 20
var price_eye: int = 10
var price_lungs: int = 5
var price_skeleton: int = 15
	
var x_price_brain: float = 2.0
var x_price_eye: float = 1.33
var x_price_lungs: float = 3.5
var x_price_skeleton: float = 1.5
	
var lvl_brain: int = 0
var lvl_eye: int = 0
var lvl_lungs: int = 0
var lvl_skeleton: int = 0
	
# REFERENCES -----------------------------------------------------------------
#Labels ----------------------------------------------------------------------
@onready var l_clicks = $"UI/RESOURCE/L Resource/L Resource Var"
	
#day/night cycle variables
	
@onready var l_resource: Label = $"UI/RESOURCE/L Resource"
@onready var l_resource_amount: Label = $"UI/RESOURCE/L Resource/L Resource Var"
	
@onready var l_lvl_brain: Label = $"UI/MENU/STORES/MAIN STORE/BRAIN/Lvl Brain Var"
@onready var l_lvl_eye: Label = $"UI/MENU/STORES/MAIN STORE/EYE/Lvl Eye Var"
@onready var l_lvl_lungs: Label = $"UI/MENU/STORES/MAIN STORE/LUNGS/Lvl Lungs Var"
@onready var l_lvl_skeleton: Label = $"UI/MENU/STORES/MAIN STORE/SKELETON/Lvl Skeleton Var"
	
@onready var l_brain: Label = $"UI/MENU/STORES/MAIN STORE/BRAIN/Lvl Brain Var/L Brain"
@onready var l_eye: Label = $"UI/MENU/STORES/MAIN STORE/EYE/Lvl Eye Var/L Eye"
@onready var l_lungs: Label = $"UI/MENU/STORES/MAIN STORE/LUNGS/Lvl Lungs Var/L Lungs"
@onready var l_skeleton: Label = $"UI/MENU/STORES/MAIN STORE/SKELETON/Lvl Skeleton Var/L Skeleton"
	
@onready var l_price_brain: Label = $"UI/MENU/STORES/MAIN STORE/BRAIN/Lvl Brain Var/L Brain/L Price Brain Var"
@onready var l_price_eye: Label = $"UI/MENU/STORES/MAIN STORE/EYE/Lvl Eye Var/L Eye/L Price Eye Var"
@onready var l_price_lungs: Label = $"UI/MENU/STORES/MAIN STORE/LUNGS/Lvl Lungs Var/L Lungs/L Price Lungs Var"
@onready var l_price_skeleton: Label = $"UI/MENU/STORES/MAIN STORE/SKELETON/Lvl Skeleton Var/L Skeleton/L Price Skeleton Var"
	
@onready var l_x_price_brain: Label = $"UI/MENU/STORES/MAIN STORE/BRAIN/Lvl Brain Var/L Brain/L Price Brain Var/L X-Price Brain Var"
@onready var l_x_price_eye: Label = $"UI/MENU/STORES/MAIN STORE/EYE/Lvl Eye Var/L Eye/L Price Eye Var/L X-Price Eye Var"
@onready var l_x_price_lungs: Label = $"UI/MENU/STORES/MAIN STORE/LUNGS/Lvl Lungs Var/L Lungs/L Price Lungs Var/L X-Price Lungs Var"
@onready var l_x_price_skeleton: Label = $"UI/MENU/STORES/MAIN STORE/SKELETON/Lvl Skeleton Var/L Skeleton/L Price Skeleton Var/L X-Price Skeleton Var"
	
#Sprite2D --------------------------------------------------------------------
@onready var img_brain: Sprite2D = $Graphics/Brain
@onready var img_eye: Sprite2D = $Graphics/Eye
@onready var img_lungs: Node2D = $Graphics/Lungs
@onready var img_skeleton: Sprite2D = $Graphics/Skeleton
	
@onready var img_day: Sprite2D = $"Background/Day Night/Day"
@onready var img_night: Sprite2D = $"Background/Day Night/Night"

@onready var img_virus: Sprite2D = $Graphics/Virus
@onready var img_vaccine: Sprite2D = $Graphics/Vaccine
# Buttons --------------------------------------------------------------------
@onready var btn_main: Label = $"UI/MAIN BUTTONS/MAIN/Label MAIN"

@onready var btn_brain: Label = $"UI/MAIN BUTTONS/MAIN BRAIN/Label Brain"
@onready var btn_eye: Label = $"UI/MAIN BUTTONS/MAIN EYES/Label Eye"
@onready var btn_lungs: Label = $"UI/MAIN BUTTONS/MAIN LUNGS/Label Lungs"
@onready var btn_skeleton: Label = $"UI/MAIN BUTTONS/MAIN SKELETON/Label Skeleton"
	
#MAIN STORE ------------------------------------------------------------------
@onready var btn_upg_brain: Button = $"UI/MENU/STORES/MAIN STORE/BRAIN/Lvl Brain Var/L Brain/L Price Brain Var/Btn Upg Brain"
@onready var btn_upg_eye: Button = $"UI/MENU/STORES/MAIN STORE/EYE/Lvl Eye Var/L Eye/L Price Eye Var/L X-Price Eye Var/Btn Upg Eye"
@onready var btn_upg_lungs: Button = $"UI/MENU/STORES/MAIN STORE/LUNGS/Lvl Lungs Var/L Lungs/L Price Lungs Var/L X-Price Lungs Var/Btn Upg Lungs"
@onready var btn_upg_skeleton: Button = $"UI/MENU/STORES/MAIN STORE/SKELETON/Lvl Skeleton Var/L Skeleton/L Price Skeleton Var/L X-Price Skeleton Var/Btn Upg Skeleton"
	
@onready var store_main: VBoxContainer = $"UI/MENU/STORES/MAIN STORE"
@onready var store_brain: VBoxContainer = $"UI/MENU/STORES/STORE BRAIN"
@onready var store_eye: VBoxContainer = $"UI/MENU/STORES/STORE EYE"
@onready var store_lungs: VBoxContainer = $"UI/MENU/STORES/STORE LUNGS"
@onready var store_skeleton: VBoxContainer = $"UI/MENU/STORES/STORE SKELETON"

# STORES ---------------------------------------------------------------------
var btn_array
var store_array
	
	
# FUNCTIONS ------------------------------------------------------------------
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	btn_array  = [ btn_brain, btn_eye, btn_lungs, btn_skeleton ]
	store_array = [ store_main, store_brain, store_eye, store_lungs, store_skeleton ]
	print(store_array)
	print("State = " + str(Global.state) + " , Load: Game")
	
	l_resource.text = RESOURCE_NAME + ":"
	l_resource_amount.text = "0"
	
	timer = timer_max
	_day_night_cycle()
	
	img_brain.set_modulate(TRANSPARENT)
	img_eye.set_modulate(TRANSPARENT)
	img_lungs.set_modulate(TRANSPARENT)
	img_skeleton.set_modulate(TRANSPARENT)
	
	btn_brain.set_modulate(RED)
	btn_eye.set_modulate(RED)
	btn_lungs.set_modulate(RED)
	btn_skeleton.set_modulate(RED)
	
	_color_store_brain(RED)
	_color_store_eye(RED)
	_color_store_lungs(RED)
	_color_store_skeleton(RED)
	
	l_price_brain.text = str(price_brain)
	l_price_eye.text = str(price_eye)
	l_price_lungs.text = str(price_lungs)
	l_price_skeleton.text = str(price_skeleton)
	
	l_x_price_brain.text = str(x_price_brain)
	l_x_price_eye.text = str(x_price_eye)
	l_x_price_lungs.text = str(x_price_lungs)
	l_x_price_skeleton.text = str(x_price_skeleton)
	
	_menu_active(store_main)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_timer(delta)
	print(str(timer) + " - Timer:" + str(hours) + ":" + str(minutes))
	
	
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
	
func _color_store_skeleton(new_col: Color) -> void:
	l_skeleton.set_modulate(new_col)
	l_lvl_skeleton.set_modulate(new_col)
	l_x_price_skeleton.set_modulate(new_col)
	btn_upg_skeleton.set_modulate(new_col)
	
	btn_skeleton.set_modulate(new_col)
	
# BUTTON PRESS ----------------------------------------------------------------
func _on_click_pressed() -> void:
	total_clicks += 1
	resource += 1 * resource_multiplier
	print("Clicks: " + str(total_clicks) + " ... Resource: " + str(resource))
	l_resource_amount.text = str(resource)
	
	# Check color clicked yellow ---------------------------------------------
	if resource >= price_brain:
		_color_store_brain(YELLOW)
	if resource >= price_eye:
		_color_store_eye(YELLOW)
	if resource >= price_lungs:
		_color_store_lungs(YELLOW)
	if resource >= price_skeleton:
		_color_store_skeleton(YELLOW)

	
func _check_store_color_red() -> void:
	if resource < price_brain: _color_store_brain(RED)
	if resource < price_eye: _color_store_eye(RED)
	if resource < price_lungs: _color_store_lungs(RED)
	if resource < price_skeleton: _color_store_skeleton(RED)
	
	if resource < price_brain: btn_brain.set_modulate(RED)
	
	
func _check_store_color_blue() -> void:
	if lvl_brain != 0: btn_brain.set_modulate(BLUE)
	if lvl_eye != 0: btn_eye.set_modulate(BLUE)
	if lvl_lungs != 0: btn_lungs.set_modulate(BLUE)
	if lvl_skeleton != 0: btn_skeleton.set_modulate(BLUE)
	
	if resource < price_brain: btn_brain.set_modulate(BLUE)
	
		
func _on_button_main_store_pressed() -> void:
	btn_main.set_modulate(GREEN)
	_menu_active(store_main)
	
func _on_button_brain_pressed() -> void:
	if lvl_brain == 0:
		pass
	elif lvl_brain > 0:
		btn_brain.set_modulate(GREEN)
		_menu_active(store_brain)
			
func _on_button_eye_pressed() -> void:
	if lvl_eye == 0:
		pass
	elif lvl_eye > 0:
		btn_eye.set_modulate(GREEN)
		_menu_active(store_eye)
		
func _on_button_lungs_pressed() -> void:
	if lvl_lungs == 0:
		pass
	elif lvl_lungs > 0:
		btn_lungs.set_modulate(GREEN)
		_menu_active(store_lungs)
		
func _on_button_skeleton_pressed() -> void:
	if lvl_skeleton == 0:
		pass
	elif lvl_skeleton > 0:
		btn_skeleton.set_modulate(GREEN)
		_menu_active(store_skeleton)
	
func _menu_active(active: VBoxContainer) -> void:
	pass
	for m in store_array:
		if m == active: m.visible = true
		else: m.visible = false
		
# UPGRADE --------------------------------------------------------------------
func _on_btn_upg_brain_pressed() -> void:
	if resource >= price_brain:
		if lvl_brain == 0:
			img_brain.set_modulate(VISIBLE)
			
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
			img_eye.set_modulate(VISIBLE)
			
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
			img_lungs.set_modulate(VISIBLE)
			
		lvl_lungs += 1
		resource -= price_lungs
		_check_store_color_red()
		price_lungs *= x_price_lungs
		
		l_lvl_lungs.text = str(lvl_lungs)
		l_price_lungs.text = str("%.2f" % price_lungs)
		l_resource_amount.text = str(resource)
	
	
func _on_btn_upg_skeleton_pressed() -> void:
	if resource >= price_skeleton:
		if lvl_skeleton == 0:
			img_skeleton.set_modulate(VISIBLE)
			
		lvl_skeleton += 1
		resource -= price_skeleton
		_check_store_color_red()
		price_skeleton *= x_price_skeleton
		
		l_lvl_skeleton.text = str(lvl_skeleton)
		l_price_skeleton.text = str("%.2f" % price_skeleton)
		l_resource_amount.text = str(resource)
	
# TIMER -----------------------------------------------------------------------
func _timer(delta: float) -> void:
	if timer <= 0:
		timer = timer_max
		if minutes == 59: 
			minutes = 1
			if hours == 23:
				hours = 1
				day = !day
				_day_night_cycle()
			else: hours += 1
		else: minutes += 1
	else: timer = timer - (delta * timer_x)
	
# DAY/NIGHT CYCLE -------------------------------------------------------------
func _day_night_cycle() -> void:
	if day == true:
		img_day.visible = true
		img_night.visible = false
	else:
		img_day.visible = false
		img_night.visible = true
	
