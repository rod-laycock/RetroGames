extends CharacterBody2D

@export var player: int
var move_speed = 5
var vel = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	if player == 1:
		if Input.is_action_pressed("Player1_Up"):
			position.y -= move_speed
		if Input.is_action_pressed("Player1_Down"):
			position.y += move_speed
	
	if player == 2:
		if Input.is_action_pressed("Player2_Up"):
			position.y -= move_speed
		if Input.is_action_pressed("Player2_Down"):
			position.y += move_speed
		
	
		

