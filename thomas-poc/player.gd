extends CharacterBody2D

var speed = 300
var click_pos = Vector2()

@onready var animated_sprite = $AnimatedSprite2D

# PLAYER STARTS IN CURRENT POSITION OF SCREEN!!
func _ready():
	click_pos = position

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
