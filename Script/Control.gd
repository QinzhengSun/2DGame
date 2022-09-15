extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal refuse
signal coinNotEnough
signal coinEnough
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible==true:
		$yes_btn.disabled=false
		$no_btn.disabled=false
	else:
		$yes_btn.disabled=true
		$no_btn.disabled=true	
	pass


func _on_yes_btn_pressed():
	if get_node("/root/Attribution").coin>=30:
		
		get_node("/root/Attribution").setCoins(-30)
		emit_signal("coinEnough")
		get_node("/root/Attribution").setJumpSkill(true)
	else:
		
		emit_signal("coinNotEnough")
	pass # Replace with function body.


func _on_no_btn_pressed():
	
	emit_signal("refuse")
	pass # Replace with function body.

	pass # Replace with function body.
