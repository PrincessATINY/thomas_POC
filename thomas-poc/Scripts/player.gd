extends CharacterBody2D
@onready var camera_2d: Camera2D = $Camera2D
@onready var animated_sprite = $AnimatedSprite2D
@onready var health_bar: float = 100
# PLAYER STARTS IN CURRENT POSITION OF SCREEN!!

@onready var main = $"."
@onready var pauseMenu = $pauseCanvas/pauseMenu
# PAUSE MENU IS INVISIBLE AT START OF GAMEPLAY!!

var speed = 300
var click_pos = Vector2()
var moving: bool = false

func _ready():
	click_pos = position
	
	# TOGGLE PAUSE MENU TO BE INVISIBLE DURING GAMEPLAY!!
	pauseMenu.visible = false
	
# POINT AND CLICK FUNCTION!!
func _physics_process(delta):
	if Input.is_action_just_pressed("leftClick"):
		click_pos = get_global_mouse_position()
	
	var distance = position.distance_to(click_pos)
	if distance > 3:
		var direction = (click_pos - position).normalized()
		velocity = direction * speed
		animated_sprite.play("Walk")
		animated_sprite.flip_h = direction.x > 0
		move_and_slide()
	else:
		animated_sprite.play("Idle")
		moving = false
		
	if Input.is_action_just_pressed("pauseMenu"):
		toggle_pause()
		
	if Input.is_action_just_pressed("quitBttn"):
		get_tree().quit()
	
# PAUSE MENU FUNCTION!!		
func toggle_pause():
	get_tree().paused = !get_tree().paused
	pauseMenu.visible = get_tree().paused
