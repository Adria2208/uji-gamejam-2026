class_name Dog

extends CharacterBody2D

@onready var animations = $DogAnimations
@onready var dog_state_machine = $DogStateMachine

@onready var game_manager: Node = get_tree().root.get_child(0)

@onready var interacting_with_player: bool = false
@onready var closest_ball_position: Vector2

func _ready() -> void:
	dog_state_machine.init(self)

func _process(delta: float) -> void:
	dog_state_machine.process_frame(delta)
