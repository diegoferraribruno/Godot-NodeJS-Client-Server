extends Node2D

var input = Vector2(0,0)
var player = ""
var speed = 1
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed
	if position.x > 320 or position.x < 0:
		speed = speed * -1

func _on_LineEdit_text_entered(new_text):
	player = new_text
