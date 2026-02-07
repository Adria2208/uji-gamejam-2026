extends State

@export
var move_state: State
	
func process_input(event: InputEvent) -> State:
	
	if Input.get_vector("move_left", "move_right", "move_up", "move_down") != Vector2.ZERO: ## If the player is pressing any movement key
		return move_state
		
	return null
	
