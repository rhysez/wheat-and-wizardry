extends CharacterBody2D

const MOVE_SPEED = 180

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * MOVE_SPEED
	
	print(typeof(direction))
	
	if direction.length() > 0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("default")
	
	move_and_slide()
