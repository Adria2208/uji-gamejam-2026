extends Dog_State

@export var chase_state: Dog_State
@export var interact_player_state: Dog_State
@export var wait_state: Dog_State

@onready var avaliable_balls: Array

func enter() -> void:
	parent.closest_ball = null

func process_frame(delta: float) -> Dog_State:
	if Input.is_action_just_pressed("interact") and !parent.interacting_with_player:
		return interact_player_state
	return search_for_ball()

func _closest_ball():
	var closest_current_ball: Ball
	var initial_distance = INF
	for i in range(avaliable_balls.size()):
		if (parent.position.distance_squared_to(avaliable_balls[i].position)) < initial_distance :
			closest_current_ball = avaliable_balls[i]
			print(str(closest_current_ball))
			initial_distance = parent.position.distance_squared_to(avaliable_balls[i].position)
	parent.closest_ball = closest_current_ball

func search_for_ball():
	for i in range(parent.game_manager.active_balls.size()):
		if parent.game_manager.active_balls[i].is_ball_pickable == true:
			avaliable_balls.append(parent.game_manager.active_balls[i])

	if avaliable_balls.size() != 0:
		_closest_ball()
		return chase_state
	else:
		return wait_state
