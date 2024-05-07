extends Control
	
#Muestra el rankin del juego
func _ready():
	mostrar_ranking()
	
func mostrar_ranking():
	ControlRanking.load_file()
	$LabelPos1.text = str(ControlRanking.ranking.pos1[0])
	$Valor1.text = str(ControlRanking.ranking.pos1[1])
	$LabelPos2.text = str(ControlRanking.ranking.pos2[0])
	$Valor1.text = str(ControlRanking.ranking.pos2[1])
	$LabelPos1.text = str(ControlRanking.ranking.pos3[0])
	$Valor1.text = str(ControlRanking.ranking.pos3[0])
	$LabelPos1.text = str(ControlRanking.ranking.pos4[0])
	$Valor1.text = str(ControlRanking.ranking.pos4[1])
	$LabelPos1.text = str(ControlRanking.ranking.pos5[0])
	$Valor1.text = str(ControlRanking.ranking.pos5[1])

#func _on_btn_back_pressed():
	#get_tree().change_scene_to_file("res://Main.tscn")
