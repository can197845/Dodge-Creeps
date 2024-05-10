extends Control


func _ready():
	pass

func _on_btn_nombre_pressed():
	get_tree().change_scene_to_file("res://Main.tscn")

func _on_name_box_text_submitted(new_text):
	ControlRanking.load_file()
	ControlRanking.ranking.namePlayer = new_text
	ControlRanking.save_file()
