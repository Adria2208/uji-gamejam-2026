extends Node

const BALL_NUMBER: int = 20

const MIN_MARGIN: Vector2 = Vector2.ZERO
const MAX_MARGIN: Vector2 = Vector2(1152,648)
const VERTICAL_OFFSET: float = 2000.0

@onready var ball_array: Array = []
@onready var timer_move_balls: Timer = $BallPicker

func _ready() -> void:
	for child in get_children():
		if child is Ball:
			ball_array.append(child)
	print(ball_array.size())


func get_random_point(p1: Vector2, p2:Vector2) -> Vector2:
	var x_value: float = randf_range(p1.x,p2.x) 
	var y_value: float = randf_range(p1.y,p2.y)
	var result: Vector2 = Vector2(x_value,y_value)
	return result


func _on_ball_picker_timeout() -> void:
	var random_index = randi_range(0,ball_array.size()-1)
	var picked_ball = ball_array[random_index]
	picked_ball.move_ball(picked_ball)
	print(str(random_index) + "" + str(picked_ball.destination))
