class_name Ball
extends Node2D

@export var ball_speed: float = 1.0

@onready var ball_sprite: Sprite2D = $BallSprite
@onready var ball_area: Area2D = $BallArea
@onready var ball_area_collision: CollisionShape2D = $BallArea/BallAreaCollision

var is_ball_active: bool = false
var ball_position: Vector2
var destination = GameManager.get_random_point(GameManager.MIN_MARGIN,GameManager.MAX_MARGIN)

func _ready() -> void:
	ball_position = GameManager.get_random_point(GameManager.MAX_MARGIN,GameManager.MAX_MARGIN)

func move_ball_downwards(current_ball: Ball) -> void:
	destination = GameManager.get_random_point(GameManager.MIN_MARGIN,GameManager.MAX_MARGIN)
	is_ball_active = true
	ball_area_collision.disabled = true

	
func move_ball_upwards(current_ball: Ball) -> void:
	destination = GameManager.get_random_point(GameManager.MIN_MARGIN,GameManager.MAX_MARGIN)
	destination.y -= GameManager.VERTICAL_OFFSET
	current_ball.position = destination
	is_ball_active = false


func _process(delta: float) -> void:
	if is_ball_active:
		self.position = position.lerp(destination, delta * ball_speed)
		if abs(global_position - destination) < Vector2(10.0,10.0):
			ball_area_collision.disabled = false


func _on_ball_area_body_entered(body: Node2D) -> void:
	move_ball_upwards(self)
