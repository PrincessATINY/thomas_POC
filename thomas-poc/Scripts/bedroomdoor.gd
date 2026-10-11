extends Area2D

var player_entered = false

@warning_ignore("unused_parameter")
func _on_body_entered(body: CharacterBody2D) -> void:
	player_entered = true

@warning_ignore("unused_parameter")
func _on_body_exited(body: CharacterBody2D) -> void:
	player_entered = false
	
@warning_ignore("unused_parameter")
func _process(delta):
	if player_entered == true:
		if Input.is_action_just_pressed("leftClick"):
			get_tree().change_scene_to_file("res://Scenes/kitchen.tscn")
