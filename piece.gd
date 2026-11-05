extends Sprite2D
class_name GamePiece

enum Player { BLUE, RED }

@export var player_owner: Player = Player.BLUE
@export var level: int = 1
var grid_position: Vector2i = Vector2i.ZERO

# Dicionário com as imagens reais de cada nível
const TEXTURES = {
	1: "res://assets/1.Agente Infiltrado.png",
	2: "res://assets/2.Fuzileiro.png",
	3: "res://assets/3.Lançador de Mísseis.png",
	4: "res://assets/4.Atirador de Elite.png",
	5: "res://assets/5.General.png"
}

# Caminho da imagem misteriosa (névoa de guerra)
const DEFAULT_TEXTURE = "res://assets/Default.png"

func setup(player: Player, lvl: int, start_pos: Vector2i):
	player_owner = player
	level = lvl
	grid_position = start_pos
	
	# Mantém a peça com sua cor original (sem pintar o soldado todo de azul/vermelho)
	modulate = Color.WHITE
	
	# REGRA DE REVELAÇÃO INICIAL:
	if player == Player.RED:
		texture = load(DEFAULT_TEXTURE)
	else:
		if TEXTURES.has(level):
			texture = load(TEXTURES[level])
	
	_adjust_scale()
	
	if has_node("Label"):
		$Label.text = str(level)
		if player == Player.RED:
			$Label.visible = false
			
	# Avisa o Godot para desenhar a borda colorida imediatamente
	queue_redraw()

func _adjust_scale():
	if texture:
		var target_size = 64.0 # Baseado no CELL_SIZE do tabuleiro
		var current_size = texture.get_size().x
		scale = Vector2(target_size / current_size, target_size / current_size)

# Função modificada para revelar a identidade do inimigo com um efeito suave de transição
func reveal_level():
	# Se a peça for do jogador Azul, ela já nasceu revelada, então apenas garante que o número apareça
	if player_owner == Player.BLUE:
		if has_node("Label"):
			$Label.visible = true
		return

	# Se for uma peça Vermelha (inimiga) oculta, criamos o efeito visual:
	var tween = create_tween()
	
	# 1. Faz a peça (e sua borda) desbotar rapidamente até ficar invisível
	tween.tween_property(self, "modulate:a", 0.0, 0.15).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	
	# 2. No milissegundo em que ela fica totalmente invisível, trocamos a arte e o texto por baixo dos panos
	tween.tween_callback(func():
		if has_node("Label"):
			$Label.visible = true
		if TEXTURES.has(level):
			texture = load(TEXTURES[level])
			_adjust_scale()
		queue_redraw() # Atualiza a moldura para o tamanho da nova imagem
	)
	
	# 3. Faz a peça reaparecer suavemente, revelando a identidade real do soldado soldado!
	tween.tween_property(self, "modulate:a", 1.0, 0.15).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)

# Função nativa do Godot usada para desenhar a moldura ao redor da peça
func _draw():
	if texture:
		var tex_size = texture.get_size()
		
		# Define a espessura da borda desejada na tela (2 pixels de largura)
		var thickness = 2.0 / scale.x
		
		# Ajusta o retângulo ligeiramente para dentro para a borda não ser cortada
		var offset = thickness / 2.0
		var rect = Rect2(
			-tex_size / 2.0 + Vector2(offset, offset), 
			tex_size - Vector2(thickness, thickness)
		)
		
		# Escolha uma cor para a borda baseada no time
		var border_color = Color(0.0, 0.5, 1.0) if player_owner == Player.BLUE else Color(1.0, 0.2, 0.2)
		
		# Desenha apenas o contorno do retângulo (filled = false)
		draw_rect(rect, border_color, false, thickness)
