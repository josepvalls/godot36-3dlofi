extends Spatial

func _ready():
	$CSGSphere.material = $CSGSphere.material.duplicate()
