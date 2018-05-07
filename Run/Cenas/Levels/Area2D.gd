extends Area2D

export(String,FILE,"*.tscn") var world

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for bodi in bodies:
		if bodi.name =='player':
			get_tree().change_scene(world)