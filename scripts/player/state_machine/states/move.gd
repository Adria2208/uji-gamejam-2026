extends State

@export
var idle_state: State

var last_direction: Vector2 = Vector2.ZERO

func enter() -> void:
	var  input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	match input_direction:
		Vector2.UP:
			parent.animated_sprite.play("move_up")
		Vector2.RIGHT:
			parent.animated_sprite.play("move_side")
		Vector2.DOWN:
			parent.animated_sprite.play("move_down")
		Vector2.LEFT:
			parent.animated_sprite.play("move_side")
			parent.animated_sprite.flip_h = true

func exit() -> void:
	parent.animated_sprite.flip_h = false # Mirror sprite to false when exiting in case player was moving left
	
func process_physics(delta: float) -> State:
	var current_direction = Input.get_vector(
		"move_left", "move_right",
		"move_up", "move_down"
	).normalized()

	parent.velocity = current_direction * move_speed
	parent.move_and_slide()

	if current_direction == Vector2.ZERO:
		return idle_state

	if current_direction != last_direction:
		update_animation(current_direction)
		last_direction = current_direction
	
	return null
	
func update_animation(direction: Vector2) -> void:
	var animation: String = ""

	if abs(direction.x) > abs(direction.y):
		animation = "move_side"
	elif direction.y < 0:
		animation = "move_up"
	else:
		animation = "move_down"

	if parent.animated_sprite.animation != animation:
		parent.animated_sprite.play(animation)

	parent.animated_sprite.flip_h = direction.x < 0
