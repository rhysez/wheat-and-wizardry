extends CharacterBody2D

const MOVE_SPEED = 90
var health = 100.0

signal health_depleted

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * MOVE_SPEED
	move_and_slide()
	
	if direction.length() > 0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("default")
	
	# Remove this and dynamically change damage rate based on the enemy
	var temp_damage_rate = 5.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		# we take damage multiplied by how many mobs are in the collission circle.
		health -= temp_damage_rate * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
