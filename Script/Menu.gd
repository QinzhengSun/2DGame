extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var p

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func start(position):
	p=position
	pass

func _on_Button_pressed():
	get_tree().paused=false
	pass # Replace with function body.


func _on_Button2_pressed():
	get_tree().change_scene("res://Scence/Homepage.tscn")
	get_tree().paused=false
	pass # Replace with function body.
