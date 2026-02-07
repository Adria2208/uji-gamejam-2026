class_name Dog_State
extends Node

@export var dog_animation_name: String
@export var dog_move_speed: float = 200.0
@onready var game_manager: Node = get_tree().root.get_child(0)

var parent: Dog

func enter() ->  void:
	parent.Dog_Animations.play(dog_animation_name)

func exit() -> void:
	pass

func process_phyisics(delta: float) -> Dog_State:
	return null

func process_frame(delta: float) -> Dog_State:
	return null
