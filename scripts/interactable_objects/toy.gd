extends CharacterBody2D
@onready var game_manager: Node2D = $".."


func _on_toy_area_body_entered(body: Node2D) -> void:
	if body is Player:
		game_manager.add_player_toy()
		self.queue_free()
	else:
		pass
