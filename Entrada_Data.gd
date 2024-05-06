extends Control




func nombre():
	var NamePlayer = str($LineEdit.text)
	return NamePlayer


func _on_btn_nombre_pressed():
	nombre()
	get_tree().change_scene_to_file("res://Main.tscn")

	
