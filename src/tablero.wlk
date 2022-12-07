import wollok.game.*

class Tablero{
	var property coordenadaInicial = game.at(0, 0)
	var property coordenadaFinal = game.at(0, 0)
	
	method ejeXMinimo() {
		return coordenadaInicial.x()
	}
	
	method ejeXMaximo() {
		return coordenadaFinal.x()
	}
	
	method ejeYMinimo() {
		return coordenadaInicial.y()
	}
	
	method ejeYMaximo() {
		return coordenadaFinal.y()
	}
	
	method puedeSeleccionar()
	method puedePoner()
}

object tableroQuatro inherits Tablero{
	method iniciarCoordenadas(){
		self.coordenadaInicial(game.at(7, 7))
		self.coordenadaFinal(game.at(16, 16))
	}
	
	override method puedeSeleccionar() = false
	override method puedePoner() = true
}

class TableroJugador inherits Tablero {
	override method puedeSeleccionar() = true
	override method puedePoner() = false
}

object tableroBlancas inherits TableroJugador{
	method iniciarCoordenadas(){
		self.coordenadaInicial(game.at(25, 5))
		self.coordenadaFinal(game.at(34, 8))
	}
	
}

object tableroNegras inherits TableroJugador{
	method iniciarCoordenadas(){
		self.coordenadaInicial(game.at(25, 14))
		self.coordenadaFinal(game.at(34, 17))
	}
}