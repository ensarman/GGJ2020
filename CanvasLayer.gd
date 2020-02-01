extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var offset1 = Vector2()
var offset2 = Vector2()
var offset3 = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	offset1.x -= 10 * delta
	$ParallaxBackground/ParallaxLayer.set_motion_offset(offset1)
	offset2.x -= 30 * delta
	$ParallaxBackground/ParallaxLayer2.set_motion_offset(offset2)
	offset3.x -= 40 * delta
	$ParallaxBackground/ParallaxLayer3.set_motion_offset(offset3)
	pass
