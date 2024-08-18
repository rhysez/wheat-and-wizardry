extends Area2D

func spell_cast():
	# Loads in our projectile as soon as game starts.
	const PROJECTILE = preload("res://scenes/spells/projectiles/MagicMissileProjectile.tscn")
	# We instantiate a new instance of our projectile to use.
	var new_projectile = PROJECTILE.instantiate()
	# We set the position and rotation of our projectile to be the position of our casting point (our mouse).
	new_projectile.global_position = %CastingPoint.global_position
	new_projectile.global_rotation = %CastingPoint.global_rotation
	# Set our projectile to be a child of the casting point.
	%CastingPoint.add_child(new_projectile)

func _physics_process(delta):
	look_at(get_global_mouse_position())
	if (Input.is_action_just_pressed('cast_active_spell')):
		spell_cast()
		print("cast")
