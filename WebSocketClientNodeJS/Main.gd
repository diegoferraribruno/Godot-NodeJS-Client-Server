extends Node2D

export var SOCKET_URL = "ws://127.0.0.1:3000"
var _client = WebSocketClient.new()
var player = "Diego"

func _ready():
	_client.connect("connection_closed", self, "_on_connection_closed")
	_client.connect("connection_error", self, "_on_connection_closed")
	_client.connect("connection_established", self, "_on_connected")
	_client.connect("data_received", self, "_on_data")
	
	var err = _client.connect_to_url(SOCKET_URL)
	if err != OK:
		print ("unable to connect")
		set_process(false)

func _process(delta):
	_client.poll()

func _input(event):
		_send(event)
	
func _on_connection_closed(was_clean = false):
	print ("Closed, clean: ", was_clean)
	set_process(false)
	
func _on_connected(proto = ""):
	print("Connected with protocol: ", proto)

func _on_data():
	var payload = JSON.parse(_client.get_peer(1).get_packet().get_string_from_utf8()).result
	print("Received data: ", payload)
	_send("HELLO WORLD")
#
func _send(event):
	var playersend = {"position":$"Player".position,"input":event}
	_client.get_peer(1).put_packet(JSON.print({player:playersend}).to_utf8())


func _on_LineEdit_text_entered(new_text):
	pass # Replace with function body.
	


func _on_LineEdit_text_changed(new_text):
	player = new_text
	pass # Replace with function body.
