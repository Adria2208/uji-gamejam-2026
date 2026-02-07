extends Dog_State

@export var wait_state: Dog_State
@export var bite_state: Dog_State
@export var interact_player_state: Dog_State

func enter() -> void:
	pass

func process_physics(delta: float) -> Dog_State:
	return null
