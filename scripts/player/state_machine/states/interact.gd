extends State

@export
var idle_state: State
var has_interacted: bool = false
const INTERACT_WAIT_TIME = 0.7

func enter() -> void:
	print(parent.game_manager.player_has_object)
	parent.animated_sprite.play("idle")
	parent.game_manager.is_player_interacting = true
	print("Entrando en el interact state")
	has_interacted = false
	await get_tree().create_timer(INTERACT_WAIT_TIME).timeout
	has_interacted = true

func process_frame(delta: float) -> State:
	if has_interacted:
		return idle_state
	return null

func exit() -> void:
	parent.game_manager.is_player_interacting = false
	parent.game_manager.player_has_object = false
	parent.game_manager.player_toy.hide()
