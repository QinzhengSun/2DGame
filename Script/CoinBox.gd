extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text
export (PackedScene) var coins
export var coinNum=0
signal createCoin
var firstTouch=true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func createCoin():
	if coinNum>0:
			var c = coins.instance()
			add_child(c)
			c.create($Area2D/Position2D.position)
			firstTouch=false
			coinNum-=1

func _on_Area2D_body_entered(body):
	if body.name=="Player":
		call_deferred("createCoin")
	pass # Replace with function body.
