extends Dog_State

@export var wait_state: Dog_State
const WAIT_TIME = 2.5
var has_bitten: bool = false

func enter() -> void:
	super()
	has_bitten = false
	AudioManager.create_2d_audio_at_location(parent.position, SoundEffect.SOUND_EFFECT_TYPE.DOG_GROWL)
	await get_tree().create_timer(WAIT_TIME).timeout
	has_bitten = true
	
func process_frame(delta: float) -> Dog_State:
	if has_bitten:
		return wait_state
	return null
