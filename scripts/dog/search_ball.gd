extends Dog_State

@export var chase_state: Dog_State
@export var interact_player_state: Dog_State
@export var wait_state: Dog_State

@onready var avaliable_balls: Array

func enter() -> void:
	parent.closest_ball_position = Vector2.ZERO

func process_frame(delta: float) -> Dog_State:
	if Input.is_action_just_pressed("interact") and !parent.interacting_with_player:
		return interact_player_state
	return search_for_ball()

func _closest_ball() -> Vector2:
	var closest_position: Vector2
	var initial_distance = 10000
	for i in range(avaliable_balls.size()):
		if (parent.position.distance_squared_to(avaliable_balls[i].position)) < initial_distance:
			closest_position = avaliable_balls[i].position
			initial_distance = parent.position.distance_squared_to(avaliable_balls[i].position)
	return closest_position

func search_for_ball():
	var avaliable_balls: Array = []
	for i in range(game_manager.ball_array.size()):
		if game_manager.ball_array[i].is_ball_active == true:
			avaliable_balls.append(game_manager.ball_array[i])
	if avaliable_balls.size() != 0:
		parent.closest_ball_position = _closest_ball()
		print(str(chase_state))
		return chase_state
	else:
		print(str(wait_state))
		return wait_state
