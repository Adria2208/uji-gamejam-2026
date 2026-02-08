class_name Player
extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: Node = $StateMachine
@onready var player_shape_cast: ShapeCast2D = $PlayerShapeCast

@export var game_manager: Node2D

func _ready() -> void:
	# Initialize the state machine, passing a reference of the playerto the states,
	# that way they can move and react accordingly
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	
	if event.is_action_pressed("exit"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

	
	state_machine.process_input(event)
	
func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func play_step_sound() -> void:
	AudioManager.create_2d_audio_at_location(self.position, SoundEffect.SOUND_EFFECT_TYPE.PLAYER_STEP)
