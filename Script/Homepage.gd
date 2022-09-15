extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Play_pressed():
	get_tree().change_scene("res://Scence/Level-1.tscn")
	pass # Replace with function body.


func _on_Exit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_Help_pressed():
	get_tree().change_scene("res://Scence/Help.tscn")
	pass # Replace with function body.
