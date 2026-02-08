class_name Dog

extends CharacterBody2D

@onready var animations: AnimatedSprite2D = $DogAnimations

@onready var dog_state_machine = $DogStateMachine
@onready var dog_collision = $DogCollision

@export var game_manager: Node2D

@onready var interacting_with_player: bool = false
@onready var next_to_a_ball: bool = false
@onready var closest_ball: Ball
@onready var dog_speed: float = 200.0

func _ready() -> void:
	dog_state_machine.init(self)

func _process(delta: float) -> void:
	dog_state_machine.process_frame(delta)
	
func _physics_process(delta: float) -> void:
	dog_state_machine.process_physics(delta)
