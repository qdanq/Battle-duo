extends Viewport

var adaptiveContent: Node2D

func _ready():
	adaptiveContent = $AdaptiveContent
	set_process(true)

func _process(delta: float):
	var window_size = DisplayServer.screen_get_size()
	adaptiveContent.scale = Vector2(window_size.x / 1920, window_size.y / 1080)
