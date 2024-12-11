extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal next

# Called when the node enters the scene tree for the first time.
func _ready():
	animate()

func animate():
	reset_ships()
	go_ships()
	
func reset_ships():
	$"TextureRect/Viewport2/Spatial/coaster-monorail-straight-hill-beginning1".hide()
	$"TextureRect/Viewport2/Spatial/coaster-monorail-straight-hill-beginning2".hide()
	$"TextureRect/Viewport2/Spatial/coaster-monorail-straight-hill-beginning3".hide()
	$"TextureRect/Viewport2/Spatial/coaster-monorail-straight-hill-beginning4".hide()
	$"TextureRect/Viewport2/Spatial/coaster-monorail-straight-hill-beginning5".hide()
	$TextureRect2/Viewport2/Ship/Squad.show()

func go_ships():
	var timer = 0.2
	yield(get_tree().create_timer(1.0), "timeout")
	pan()
	$TextureRect2/Viewport2/Ship/Squad/fightership3.hide()
	activate_trail($"TextureRect/Viewport2/Spatial/coaster-monorail-straight-hill-beginning3")
	yield(get_tree().create_timer(timer), "timeout")
	$TextureRect2/Viewport2/Ship/Squad/fightership2.hide()
	activate_trail($"TextureRect/Viewport2/Spatial/coaster-monorail-straight-hill-beginning2")
	yield(get_tree().create_timer(timer), "timeout")
	$TextureRect2/Viewport2/Ship/Squad/fightership4.hide()
	activate_trail($"TextureRect/Viewport2/Spatial/coaster-monorail-straight-hill-beginning4")
	yield(get_tree().create_timer(timer), "timeout")
	$TextureRect2/Viewport2/Ship/Squad/fightership5.hide()
	activate_trail($"TextureRect/Viewport2/Spatial/coaster-monorail-straight-hill-beginning5")
	yield(get_tree().create_timer(timer), "timeout")
	$TextureRect2/Viewport2/Ship/Squad/fightership1.hide()
	activate_trail($"TextureRect/Viewport2/Spatial/coaster-monorail-straight-hill-beginning1")

func pan():
	var tween = create_tween()
	tween.set_parallel()
	tween.tween_property($"Viewport/15", "position", Vector2(0,0), 3.0).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property($TextureRect, "rect_position", Vector2(0,120), 3.0).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property($TextureRect2, "rect_position", Vector2(0,120), 3.0).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)


func activate_trail(trail):
	trail.show()
	#var mat = trail.get_node("coaster-monorail-straight-hill-beginning").mesh.surface_get_material(0).duplicate() as Material3D
	#trail.get_node("coaster-monorail-straight-hill-beginning").mesh.surface_set_material(0, mat)
	#mat.albedo_color = Color.white
	#var tween = create_tween()
	#tween.tween_property(mat, "albedo_color", Color("#ddddee"), 1.0).set_ease(Tween.EASE_OUT)
