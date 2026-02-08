extends Dog_State

@export var search_state: Dog_State
const WAIT_TIME = 2.0
var has_waited: bool = false

func enter()-> void:
	parent.animations.play("idle")
	has_waited = false
	await get_tree().create_timer(WAIT_TIME).timeout
	has_waited = true


func process_frame(delta: float) -> Dog_State:
	if has_waited:
		return search_state
	return null
