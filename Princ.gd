extends Control

var Mensajes = JSON.parse_string(FileAccess.get_file_as_string("res://mensajes.json"))
var Colores = [
	"#FF5733",  # Rojo cor
	"#33FF57",  # Verde neon
	"#3357FF",  # Azul elec
	"#F3FF33",  # Amarillo bri
	"#FF33F3",  # Magenta vibr
	"#33FFF3",  # Cian aguamar
	"#A033FF",  # Púrpura intenso
	"#FFB833",  # Naranja cal
	"#33FFB8",  # Menta
	"#B833FF"   # Violeta
]

func EnviarChat() -> void:
	
	var Mensaje : String = ""
	Mensaje+=str("[color=",Colores.pick_random(),"]")
	Mensaje+=Mensajes["NombresUsuarioPARTE1"].pick_random()
	Mensaje+=Mensajes["NombresUsuarioPARTE2"].pick_random()
	Mensaje+=Mensajes["NombresUsuarioPARTE3"].pick_random()
	Mensaje+="[/color]: "
	Mensaje+=Mensajes["ArrayMensajes"].pick_random()
	Mensaje+="\n"
	$CajaTwichChat/SC/TwichChat.text+=Mensaje
	$CajaTwichChat/SC.scroll_vertical=-1
