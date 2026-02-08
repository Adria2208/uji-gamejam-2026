extends State

@export
var idle_state: State
@export
var interact_state: State

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

	match current_direction:
		Vector2.UP:
			parent.player_shape_cast.target_position = Vector2(0,-20)
		Vector2.RIGHT:
			parent.player_shape_cast.target_position = Vector2(20,0)
		Vector2.DOWN:
			parent.player_shape_cast.target_position = Vector2(0,20)
		Vector2.LEFT:
			parent.player_shape_cast.target_position = Vector2(-20,0)

	parent.velocity = current_direction * move_speed
	parent.move_and_slide()

	if current_direction == Vector2.ZERO:
		return idle_state

	if current_direction != last_direction:
		update_animation(current_direction)
		last_direction = current_direction
		
	parent.play_step_sound()
	
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

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("interact"):
		if parent.game_manager.player_has_object:
			if parent.player_shape_cast.is_colliding() and parent.player_shape_cast.get_collider(0) is Dog:
				return interact_state
	return null
