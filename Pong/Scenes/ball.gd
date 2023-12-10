extends RigidBody2D

@export var x_velocity: int = 0
@export var y_velocity: int = 0
@export var speed: float = 400.0

func respawn():
	var ball = preload("res://Pong/Scenes/ball.tscn")
	ball.instantiate()
	
	
#func start(pos):
#	position = pos
#	show()
#	$CollisionShape2D.disabled = false

# Called when the node enters the scene tree for the first time.
func _ready():
	# Choose a random direction to travel in - horizontally 
	# 0 = left, 1 = right
	if x_velocity == 0:
		x_velocity = get_initial_direction()
	
	if y_velocity == 0:
		y_velocity = randomise_angle()

	self.linear_velocity.x = x_velocity
	self.linear_velocity.y = y_velocity


func get_initial_direction():
	var direction = randi()%2
	if direction == 1:
		return speed
	else:
		return -speed
	
func randomise_angle():
	var angle = randf_range(-speed, speed)
	return angle

func _on_body_entered(body):
	var playerGoal = body.get("playerGoal")
	var main = get_node("/root/Main")
	
	if (playerGoal != null):
		if playerGoal == 2:
			main.player1Score += 1
			var p1Score = get_node("/root/Pong/Pong/Player1Score")
			p1Score.text = str(main.player1Score)
		elif playerGoal == 1:
			main.player2Score += 1
			var p2Score = get_node("/root/Pong/Pong/Player2Score")
			p2Score.text = str(main.player2Score)

		self.queue_free()
		
		if max(main.player1Score, main.player2Score) < 10:
			self.respawn()
		else:
			if (main.player1Score > main.player2Score):
				print("Player1 wins")
			else:
				print("Player2 wins")
	
