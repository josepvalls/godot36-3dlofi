extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	OS.get_user_data_dir()
	var image = $Sprite.texture.get_data()
	image.flip_y()
	image.save_png("user://racer.png") 
