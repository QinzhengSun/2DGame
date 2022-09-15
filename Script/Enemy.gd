extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var parent = get_parent()
export var speed =0
export var turnBack = 0
export var health = 100
export var def = 0 
var isEnemy=true
var catch=false
var target
var die=false
var hurting = false
var vectoy
onready var start_position=global_position
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func take_damage(var damage):
	#自身受到伤害， damage为伤害量
	hurting=true
	$AnimatedSprite.play("Hurt")
	health-=damage-def
	$ProgressBar.value=health
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass

func move(d):
	#控制怪物移动沿固定轨迹移动
	if hurting==false:
		$AnimatedSprite.play("Idle")
		if parent is PathFollow2D:
			if get_node("/root/Attribution").hurting==false:
				parent.set_offset(parent.get_offset() + speed*d)
			else:
				parent.set_offset(parent.get_offset() - speed*d)
			if parent.offset > turnBack:
				$AnimatedSprite.flip_h=true
			else:
				$AnimatedSprite.flip_h=false		
	pass # Replace with function body.\
func die(score):
	#score ----- 怪物死亡时获得的分数
	die=true
	$AnimatedSprite.play("Die")
	$Die.playing=true
	get_node("/root/Attribution").setScore(score)
	$Bodyshape.disabled=true	
	$TouchPlayer.monitoring=false
	pass
func catch():
	#能够捕获玩家并自动跟踪
	if hurting==false:
		if die==false&&get_node("/root/Attribution").die==false:
			$AnimatedSprite.play("Idle")
			while(parent.name!="Level-1"):
				parent=parent.get_parent()
			target = parent.get_node("Player").position
			if catch==true:
				if get_node("/root/Attribution").hurting==false:
					 vectoy = position.direction_to(target)*speed
				else:
					 vectoy=-position.direction_to(target)*speed
				move_and_slide(vectoy)
				if position.x-target.x>0:
					$AnimatedSprite.flip_h=true
				else:
					$AnimatedSprite.flip_h=false
	pass
func _on_Area2D_body_entered(body):
	if body.name=="Player":
		catch=true
	pass # Replace with function body.
func _on_Area2D_body_exited(body):
	if body.name=="Player":
		catch=false	
		
	pass 
func _on_TouchPlayer_body_entered(body):
	if body.name=="Player":
		if $Attack.playing==false:
			$Attack.playing=true
		body.hurt()
	
	pass # 
func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation=="Hurt":
		hurting=false
	if $AnimatedSprite.animation=="Die":
		queue_free()
