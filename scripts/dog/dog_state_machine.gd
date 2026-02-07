extends Node

@export var starting_state: Dog_State

var current_state: Dog_State

func init(parent:Dog) -> void:
	for child in get_children():
		child.parent = parent
	change_state(starting_state)

func change_state(new_state:Dog_State) -> void:
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()
	print("Entering state: " + str(current_state))

func process_physics(delta:float) -> void:
	var new_state = current_state.process_phyisics(delta)
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
