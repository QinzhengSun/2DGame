extends "res://Script/Enemy.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	catch()
	if !die:
		if health<=0:
			die(10)	
	pass

	

# Replace with function body.






	pass # Replace with function body.



