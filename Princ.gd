extends Control
var Audio1 = preload("res://audios/donacion_xd.mp3")
var Audio2 = preload("res://audios/donacion_xd.mp3")
var peer = PacketPeerUDP
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



func EnviarSuper() -> void:
	if not $Caja_Super.visible:
		var Mensaje_Don : String = ""
		Mensaje_Don+=Mensajes["NombresUsuarioPARTE1"].pick_random()
		Mensaje_Don+=Mensajes["NombresUsuarioPARTE2"].pick_random()
		Mensaje_Don+=Mensajes["NombresUsuarioPARTE3"].pick_random()
		var Mensaje_Sel : Dictionary = Mensajes["Donaciones"][str("don",randi_range(1,Mensajes["Donaciones"].size()))]
		Mensaje_Don+=str(" ha donado ", Mensajes["Donaciones_cantidades"].pick_random(),"\n\n", Mensaje_Sel["texto"])
		$AUDIO_DON.stream = get(Mensaje_Sel["audio"])
		$Caja_Super/Mensaje_Donacion.text=Mensaje_Don
		$Caja_Super.show()
		$Caja_Super/Video.play()
		await get_tree().create_timer(1.75).timeout
		$AUDIO_DON.play()
		await $Caja_Super/Video.finished
		$Caja_Super.hide()
	else:
		pass # Ya esta abierto, aunque esto sobra






func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Superchat"):
		EnviarSuper()
	if Input.is_action_just_pressed("Ganar"):
		Mensajes_Rapidos_Ganar()


func Mensajes_Rapidos_Ganar() -> void:
	for i in 75:
		var Mensaje : String = ""
		Mensaje+=str("[color=",Colores.pick_random(),"]")
		Mensaje+=Mensajes["NombresUsuarioPARTE1"].pick_random()
		Mensaje+=Mensajes["NombresUsuarioPARTE2"].pick_random()
		Mensaje+=Mensajes["NombresUsuarioPARTE3"].pick_random()
		Mensaje+="[/color]: "
		Mensaje+=Mensajes["MensajesPositivoGanar"].pick_random()
		Mensaje+="\n"
		$CajaTwichChat/SC/TwichChat.text+=Mensaje
		await get_tree().create_timer(randf_range(0.025,0.17)).timeout
