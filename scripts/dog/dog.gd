class_name Dog

extends CharacterBody2D

@onready var animations = $DogAnimations
@onready var dog_state_machine = $DogStateMachine

func _ready() -> void:
	dog_state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	dog_state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	dog_state_machine.process_physics(delta)

func _process(delta: float) -> void:
	dog_state_machine.process_frame(delta)
