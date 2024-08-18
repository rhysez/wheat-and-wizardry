extends Area2D

const MOVE_SPEED = 20000
const MAX_RANGE = 20000

var travel_distance = 0

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * MOVE_SPEED * delta
	
	travel_distance += MOVE_SPEED * delta
	if (travel_distance > MAX_RANGE):
		queue_free()


func _on_body_entered(body):
	queue_free()
	if (body.has_method("take_damage")):
		body.take_damage()
