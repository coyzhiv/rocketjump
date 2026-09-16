extends HSlider

var bus_index: int 
func _ready():
	bus_index = AudioServer.get_bus_index("Music")
	value_changed.connect(_on_value_changed)

	value = db_to_linear(
		AudioServer.get_bus_volume_db(bus_index)
	)
func _on_value_changed(value:float):
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(value)
	)
