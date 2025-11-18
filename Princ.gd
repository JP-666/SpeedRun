extends Control

var Mensajes = JSON.parse_string(FileAccess.get_file_as_string("res://mensajes.json"))


func EnviarChat() -> void:
	print("Ej")
	var Mensaje : String = ""
	Mensaje+=Mensajes["NombresUsuarioPARTE1"].pick_random()
	Mensaje+=Mensajes["NombresUsuarioPARTE2"].pick_random()
	Mensaje+=Mensajes["NombresUsuarioPARTE3"].pick_random()
	Mensaje+=": "
	Mensaje+=Mensajes[["ArrayMensajes","ArrayMensajesNegativos","ArrayMensajesRaros"].pick_random()].pick_random()
	Mensaje+="\n"
	$CajaTwichChat/TwichChat.text+=Mensaje
