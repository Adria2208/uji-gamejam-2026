extends Node

const BALL_NUMBER: int = 20

const MIN_MARGIN: Vector2 = Vector2(310,200)
const MAX_MARGIN: Vector2 = Vector2(850,450)
const VERTICAL_OFFSET: float = 500.0

@onready var player_has_object: bool = false
@onready var ball_array: Array = []
@onready var active_balls: Array = []
@onready var timer_move_balls: Timer = $BallPicker
@onready var is_player_interacting: bool = false
@export var toy: PackedScene = preload("res://scenes/toy.tscn")
@onready var player_toy: Sprite2D = $CanvasLayer/PlayerToy
@onready var general_timer: Timer = $GeneralTimer
@onready var tiempo_restante: RichTextLabel = $CanvasLayer/TiempoRestante
@onready var ball_counter: RichTextLabel = $CanvasLayer/BallCounter
@onready var total_points: int
@onready var tiempo_en_segundos: int

var timer_spawn_objects: Timer

func _ready() -> void:
	for child in get_children():
		if child is Ball:
			ball_array.append(child)

	player_toy.hide()
	timer_spawn_objects = $SpawnObjects


func get_random_point(p1: Vector2, p2:Vector2) -> Vector2:
	var x_value: float = randf_range(p1.x,p2.x) 
	var y_value: float = randf_range(p1.y,p2.y)
	var result: Vector2 = Vector2(x_value,y_value)
	return result

func _on_ball_picker_timeout() -> void:
	var random_index = randi_range(0,ball_array.size()-1)
	if ball_array.size() != 0:
		var picked_ball = ball_array[random_index]
		active_balls.append(picked_ball)
		ball_array.remove_at(random_index)
		picked_ball.move_ball_downwards(picked_ball)
	else:
		pass

func _on_spawn_objects_timeout() -> void:
	var new_spawn_timer_time = randi_range(5,10)
	timer_spawn_objects.wait_time = new_spawn_timer_time
	
	var spawned_toy = toy.instantiate()
	get_tree().current_scene.add_child(spawned_toy)
	spawned_toy.position = get_random_point(MIN_MARGIN,MAX_MARGIN)
	spawned_toy.scale *= 0.6
	
func add_player_toy():
	player_toy.show()
	player_has_object = true
	pass


func _on_general_timer_timeout() -> void:
	get_tree().quit()

func display_time()-> void:
	tiempo_en_segundos += 1
	var m = int(tiempo_en_segundos/60)
	var s = tiempo_en_segundos - m * 60
	tiempo_restante.text = '%02d:%02d' % [m,s]

func add_score():
	total_points += 1
	ball_counter.text = "Pelotas totales: " + str(total_points)


func _on_timer_segundos_timeout() -> void:
	display_time()
