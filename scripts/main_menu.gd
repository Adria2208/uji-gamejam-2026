extends Node2D

@onready var animation_player: AnimationPlayer = $UI/AnimationPlayer


func _on_button_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_button_volume_tutorial_pressed() -> void:
	animation_player.play("swipe")


func _on_back_button_pressed() -> void:
	animation_player.play_backwards("swipe")
