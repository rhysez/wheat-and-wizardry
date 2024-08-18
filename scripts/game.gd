extends Node2D

func spawn_mob():
	var new_mob = preload("res://scenes/enemies/VampireImp.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	# This adds the mob to the tree of objects
	add_child(new_mob)


func _on_timer_timeout():
	# Comment this line out to prevent mobs spawning.
	spawn_mob()


func _on_player_wizard_health_depleted():
	%DeathScreen.visible = true
	get_tree().paused = true
