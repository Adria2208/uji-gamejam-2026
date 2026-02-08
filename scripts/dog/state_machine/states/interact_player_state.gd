extends Dog_State

@export var wait_state: Dog_State

func enter() -> void:
	pass

func process_frame(delta: float) -> Dog_State:
	return wait_state
