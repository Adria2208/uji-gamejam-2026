extends State

@export
var idle_state: State

func enter() -> void:
	print("Entrando en el interact state")

func process_frame(delta: float) -> State:
	return idle_state
