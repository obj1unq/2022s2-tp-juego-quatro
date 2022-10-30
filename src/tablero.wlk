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
}

object tableroQuatro inherits Tablero{
	method iniciarCoordenadas(){
		self.coordenadaInicial(game.at(7, 7))
		self.coordenadaFinal(game.at(16, 16))
	}
}

object tableroBlancas inherits Tablero{
	method iniciarCoordenadas(){
		self.coordenadaInicial(game.at(25, 4))
		self.coordenadaFinal(game.at(34, 7))
	}
}

object tableroNegras inherits Tablero{
	method iniciarCoordenadas(){
		self.coordenadaInicial(game.at(25, 13))
		self.coordenadaFinal(game.at(34, 16))
	}
}