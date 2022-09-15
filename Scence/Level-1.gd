extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bat_catch=false
var attackTime = 0
var meat_appear=false
export (PackedScene) var meat 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if attackTime == 3:
		if meat_appear==false:
			$Label.set_text("攻击力太低了，吃下这个肉")
			var m=meat.instance()
			add_child(m)
			m.creat($MeatCreator.position)
			meat_appear=true
	pass


func _on_Player_shoot(ball,position,direction,atk):
	attackTime+=1
	var f = ball.instance()
	add_child(f)
	f.start(position,direction,atk)
	pass # Replace with function body.


func _on_spikes_body_entered(body):
	if body.name == "Player":
		get_node("/root/Attribution").setLife(get_node("/root/Attribution").life)
		
	pass # Replace with function body.


			
			


func _on_SpikeMonitor_body_entered(body):
	if body.name=="Player":
		$Spikes/FallSpike.catch=true
		$Spikes/SpikeMonitor.queue_free()	
	pass # Replace with function body.





func _on_YellowBat_shoot(teeth,p,dir):
	var t = teeth.instance()
	add_child(t)
	t.start(p,dir)
	pass # Replace with function body.


 # Replace with function body.


func _on_Door_body_entered(body):
	if body.name=="Player":
		get_tree().change_scene("res://Scence/Win.tscn")
	pass # Replace with function body.


func _on_Coin_touch():
	$Sound/Coin.playing=true
	pass # Replace with function body.


func _on_Meat_body_entered(body):
	if body.name=="Player":
		$Sound/Meat.playing=true
	pass # Replace with function body.


func _on_Heart_heartTouch():
	$Sound/Heart.playing=true
	pass # Replace with function body.
