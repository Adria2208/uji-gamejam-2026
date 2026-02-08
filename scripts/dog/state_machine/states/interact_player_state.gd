extends Dog_State

@export var wait_state: Dog_State

func enter() -> void:
	AudioManager.create_2d_audio_at_location(parent.position, SoundEffect.SOUND_EFFECT_TYPE.DOG_INTERACT_GROWL)
	AudioManager.create_2d_audio_at_location(parent.position, SoundEffect.SOUND_EFFECT_TYPE.DOG_INTERACT_NICE)

func process_frame(delta: float) -> Dog_State:
	return wait_state
