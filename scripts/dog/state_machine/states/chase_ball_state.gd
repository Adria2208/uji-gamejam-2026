extends Dog_State

@export var wait_state: Dog_State
@export var bite_state: Dog_State
@export var interact_player_state: Dog_State

func enter() -> void:
	AudioManager.create_2d_audio_at_location(parent.position,SoundEffect.SOUND_EFFECT_TYPE.DOG_BARK)

func process_frame(delta: float) -> Dog_State:
	
	if Input.is_action_just_pressed("interact") and !parent.interacting_with_player:
		return interact_player_state
	
	parent.position = parent.position.move_toward(parent.closest_ball.position,delta * parent.dog_speed)
	if parent.closest_ball.is_ball_pickable == true:
		if parent.position.distance_to(parent.closest_ball.position) < 10.0:
			print("He mordido la pelota")
			return bite_state
	else:
		return wait_state
	return null

func process_physics(delta: float) -> Dog_State:
	print("HE ENTRADO EN process_phyisics")
	var direction: Vector2 = parent.velocity
	var animation: String = ""
	
	if abs(direction.x) > abs(direction.y):
		animation = "move_side"
	elif direction.y < 0:
		animation = "move_down"
	else:
		animation = "move_up"
		
	if parent.animations.animation != animation:
		parent.animations.play(animation)

	parent.animations.flip_h = direction.x < 0
	
	return null
