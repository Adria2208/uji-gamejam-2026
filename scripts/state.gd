class_name Dog_State

extends Node

@export var dog_animation_name: String
@export var dog_move_speed: float = 200.0

var parent: Dog

func enter() ->  void:
	parent.Dog_Animations.play(dog_animation_name)

func exit() -> void:
	pass

func process_input(event: InputEvent) -> Dog_State:
	return null

func process_frame(delta: float) -> Dog_State:
	return null

func process_physics(delta: float) -> Dog_State:
	return null
