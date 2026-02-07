extends Dog_State

@export var wait_state: Dog_State
@export var bite_state: Dog_State
@export var interact_player_state: Dog_State

func enter() -> void:
	pass

func process_frame(delta: float) -> Dog_State:
	
	if Input.is_action_just_pressed("interact") and !parent.interacting_with_player:
		return interact_player_state
	
	parent.position = parent.position.move_toward(parent.closest_ball.position,delta * parent.dog_speed)
	
	if abs(parent.closest_ball.position - parent.position) < Vector2(10.0,10.0):
		return bite_state
	else:
		return null
