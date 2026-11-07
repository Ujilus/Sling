extends Label



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	$".".text = str(Global.points)
