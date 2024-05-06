extends Node

@export var mob_scene: PackedScene
var score

func _ready():
	pass
	
func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUB.show_game_over()
	$Music.stop()
	$DeathSound.play()
	$HUB/ButtonOptions.show()
	record(score)


func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUB.update_score(score)
	$HUB.show_message("Get Ready")
	$Music.play()
	


func _on_mob_timer_timeout():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	
	add_child(mob)


func _on_score_timer_timeout():
	score += 1
	$HUB.update_score(score)

func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func record(tiempo):
	ControlRanking.load_file()
	if tiempo>= ControlRanking.ranking.pos1[1]:
		get_tree().change_scene_to_file("res://Entrada_Data.tscn")
		var nom = EntradaData.name
		ControlRanking.ranking.pos1[0] = nom
		ControlRanking.ranking.pos1[1]= tiempo
		ControlRanking.save_file()
	else :
		print('no pudo')
	
