extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var life = 4 setget setLife 
var atk = 10 setget setAtk
var coin=0 setget setCoins
var score=0 setget setScore
var hurting=false
var die=false
var secondJump=false setget setJumpSkill

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.



func init():
	life=4
	atk=10
	coin=0
	score=0
	hurting=false
	die=false
	secondJump=false
	pass
func setLife(value):
	if die==false:
		life -= value
	pass
func setAtk(value):
	atk+=value
	pass
func setCoins(value):
	coin+=value
	pass
func setScore(value):
	score+=value
func setJumpSkill(value):
	secondJump=value
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
