extends Button

func _ready():
	# Button size (bigger for touch)
	custom_minimum_size = Vector2(250, 80)
	
	# Create StyleBox for normal state
	var style_normal = StyleBoxFlat.new()
	style_normal.bg_color = Color(0.2, 0.6, 1.0)  # Blue color
	style_normal.corner_radius_top_left = 10
	style_normal.corner_radius_top_right = 10
	style_normal.corner_radius_bottom_left = 10
	style_normal.corner_radius_bottom_right = 10
	style_normal.border_width_left = 2
	style_normal.border_width_right = 2
	style_normal.border_width_top = 2
	style_normal.border_width_bottom = 2
	style_normal.border_color = Color(0.1, 0.4, 0.8)
	
	# Create StyleBox for hover state
	var style_hover = StyleBoxFlat.new()
	style_hover.bg_color = Color(0.3, 0.7, 1.0)  # Lighter blue
	style_hover.corner_radius_top_left = 10
	style_hover.corner_radius_top_right = 10
	style_hover.corner_radius_bottom_left = 10
	style_hover.corner_radius_bottom_right = 10
	style_hover.border_width_left = 2
	style_hover.border_width_right = 2
	style_hover.border_width_top = 2
	style_hover.border_width_bottom = 2
	style_hover.border_color = Color(0.2, 0.5, 0.9)
	
	# Create StyleBox for pressed state
	var style_pressed = StyleBoxFlat.new()
	style_pressed.bg_color = Color(0.1, 0.4, 0.8)  # Darker blue
	style_pressed.corner_radius_top_left = 10
	style_pressed.corner_radius_top_right = 10
	style_pressed.corner_radius_bottom_left = 10
	style_pressed.corner_radius_bottom_right = 10
	style_pressed.border_width_left = 2
	style_pressed.border_width_right = 2
	style_pressed.border_width_top = 2
	style_pressed.border_width_bottom = 2
	style_pressed.border_color = Color(0.05, 0.3, 0.6)
	
	# Apply styles
	add_theme_stylebox_override("normal", style_normal)
	add_theme_stylebox_override("hover", style_hover)
	add_theme_stylebox_override("pressed", style_pressed)
	add_theme_stylebox_override("focus", style_hover)
	
	# Font styling (bigger font for touch)
	add_theme_font_size_override("font_size", 20)
	add_theme_color_override("font_color", Color.WHITE)
	add_theme_color_override("font_hover_color", Color.WHITE)
	add_theme_color_override("font_pressed_color", Color.WHITE)
	
	# Touch feedback
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)

func _on_button_down():
	# Scale down effect for touch feedback
	create_tween().tween_property(self, "scale", Vector2(0.95, 0.95), 0.1)

func _on_button_up():
	# Scale back to normal
	create_tween().tween_property(self, "scale", Vector2(1.0, 1.0), 0.1)
