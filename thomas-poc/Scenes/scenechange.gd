extends Area2D

var player_entered = false



func _on_body_entered(body: CharacterBody2D) -> void:
	player_entered = true


func _on_body_exited(body: CharacterBody2D) -> void:
	player_entered = false
	
func _process(delta):
	if player_entered == true:
		if Input.is_action_just_pressed("leftClick"):
			pass
			#https://www.bing.com/videos/riverview/relatedvideo?q=godot+scene+transition+when+clicking+on+2d+object+&&mid=9A9785AD688214AD7F1B9A9785AD688214AD7F1B&churl=https%3a%2f%2fwww.youtube.com%2fchannel%2fUCSehnx-yuPok8rOWlPIGGOQ&mmscn=mtsc&aps=64&FORM=VMSOVR
