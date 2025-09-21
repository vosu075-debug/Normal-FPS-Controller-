extends Node2D

func _ready() -> void:
	# Sob 2D node class instantiate korbo ar screen e add korbo
	var y_offset = 0
	
	var node_classes = [
		Sprite2D,
		Label,
		Button,
		TileMap,
		ColorRect,
		NinePatchRect,
		Polygon2D,
		Line2D,
		AnimatedSprite2D,
		Area2D
	]
	
	for cls in node_classes:
		var node = cls.new()
		
		# Position kore dibo jate overlap na hoy
		if node is Node2D:
			node.position = Vector2(200, 50 + y_offset)
		elif node is Control:
			node.position = Vector2(400, 50 + y_offset)
		
		# Example content set kori
		match cls:
			Sprite2D:
				var tex = GradientTexture2D.new()
				tex.width = 64
				node.texture = tex
			Label:
				node.text = "Hello Label"
			Button:
				node.text = "Click Me"
			ColorRect:
				node.color = Color(1, 0, 0, 0.5)
				node.size = Vector2(100, 40)
			NinePatchRect:
				node.size = Vector2(120, 60)
			Polygon2D:
				node.polygon = PackedVector2Array([Vector2(0,0), Vector2(50,0), Vector2(25,50)])
				node.color = Color.GREEN
			Line2D:
				node.points = [Vector2(0,0), Vector2(100,50)]
				node.width = 4
			AnimatedSprite2D:
				node.sprite_frames = SpriteFrames.new()
			Area2D:
				var col = CollisionShape2D.new()
				var shape = CircleShape2D.new()
				shape.radius = 20
				col.shape = shape
				node.add_child(col)
		
		add_child(node)
		y_offset += 80
