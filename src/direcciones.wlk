import wollok.game.*
import quatro.*

class Direccion{
	method siguientes(pos, n)
	
	method avanzar(nuevaPos){
		return game.at(self.nuevoX(nuevaPos.x()), self.nuevoY(nuevaPos.y()))
	}
	
	method nuevoX(xAMover){
		return xAMover.max(quatro.ejeXMinimo()).min(quatro.ejeXMaximo())
	}
	
	method nuevoY(yAMover){
		return yAMover.max(quatro.ejeYMinimo()).min(quatro.ejeYMaximo())
	}
}

object izquierda inherits Direccion{
	override method siguientes(pos, n) {
		return pos.left(n)
	}		
}

object derecha inherits Direccion{
	override method siguientes(pos, n) {
		return pos.right(n)		
	}		
	
}

object arriba inherits Direccion{
	override method siguientes(pos, n) {
		return pos.up(n)				
	}		
	
}

object abajo inherits Direccion{
	override method siguientes(pos, n) {
		return pos.down(n)		
	}		
	
}
// created by leo gassman