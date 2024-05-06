extends Control

const PATH_FILE = "user://ranking.dat"

#_ _______________________Variables ___________________
var ranking : Dictionary = {
	"pos1" = ["Jorge",50],
	"pos2" = ["Pedro",45],
	"pos3" = ["Raul",35],
	"pos4" = ["Fran",30],
	"pos5" = ["Jhony",25]
} 
var score =100
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
		
