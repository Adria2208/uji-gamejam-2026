extends State

@export
var idle_state: State

func process_physics(delta: float) -> State:
	
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	parent.velocity = input_direction * move_speed
	parent.move_and_slide()
		
	if input_direction == Vector2.ZERO:
		return idle_state
	
	return null
