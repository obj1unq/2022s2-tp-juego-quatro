object izquierda {
	method siguientes(pos, n) {
		return pos.left(n)
	}		
}

object derecha {
	method siguientes(pos, n) {
		return pos.right(n)		
	}		
	
}

object arriba {
	method siguientes(pos, n) {
		return pos.up(n)				
	}		
	
}

object abajo {
	method siguientes(pos, n) {
		return pos.down(n)		
	}		
	
}