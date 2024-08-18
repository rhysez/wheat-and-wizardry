extends CharacterBody2D

# The @onready annotation waits for the VampireImp to have spawned before we try to get the position of it.
@onready var player = get_node("/root/Game/Characters/PlayerWizard")

const MOVE_SPEED = 300
var hit_points = 10

func _physics_process(delta):
	# We get the global position of PlayerWizard and distance towards it.
	var direction = global_position.direction_to(player.global_position)
	# We set our velocity equal to the position of the PlayerWizard, the distance from it, and MOVE_SPEED.
	velocity = direction * MOVE_SPEED
	move_and_slide()

func take_damage(total_damage):
	hit_points -= total_damage
	if (hit_points <= 0):
		queue_free()
