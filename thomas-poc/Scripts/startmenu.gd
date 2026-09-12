extends Control
@onready var buttons_v_box = %buttonsVBox
signal start_game()

func _ready() -> void:
	focus_button()
	
func _on_start_game_button_pressed() -> void:
	start_game.emit()
	get_tree().change_scene_to_file("res://Scenes/bedroom.tscn")
	hide()
	
func _on_quit_button_pressed() -> void:
	get_tree().quit()
	
func _on_visibility_changed() -> void:
	if visible:
		focus_button()
		
func focus_button() -> void:
	if buttons_v_box:
		var button: Button = buttons_v_box.get_child(0)
		if button is Button:
			button.grab_focus()
