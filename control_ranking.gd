extends Control
#_________________________Constantes _______________

const PATH_FILE = "user://ranking.dat"

#_ _______________________Variables ___________________
var ranking : Dictionary = {
	"pos1" = ["Jorge",5],
	"pos2" = ["Pedro",4],
	"pos3" = ["Raul",3],
	"pos4" = ["Fran",2],
	"pos5" = ["Jhony",1]
} 

func _ready():
	
	pass

func save_file():
	
	var ranking_file = FileAccess.open(PATH_FILE,FileAccess.WRITE)
	
	ranking_file.store_var(ranking)
	ranking_file = null

	
func load_file():
	
	if FileAccess.file_exists(PATH_FILE): #Comprobamos si el archvo no existe y le cargamos los datos
		#___ Cargamos la variable con la ruta del archivo para la lectura
		var ranking_file = FileAccess.open(PATH_FILE,FileAccess.READ)
		
		ranking = ranking_file.get_var()
		ranking_file = null
		
#Muestra el rankin del juego

func mostrar_ranking():
	load_file()
	$LabelPos1.text = str(ranking.pos1[0])

func _on_btn_back_pressed():
	get_tree().change_scene_to_file("res://Main.tscn")
