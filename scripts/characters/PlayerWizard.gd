extends CharacterBody2D

const MOVE_SPEED = 180

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * MOVE_SPEED
	
	move_and_slide()
