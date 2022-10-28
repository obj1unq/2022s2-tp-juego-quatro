import wollok.game.*
import tablero.*

object selector{
	var property tablero = tableroQuatro
	var property position = tablero.coordenadaInicial()
	
	method image() = "pepita.png"
	
	method mover(direccion){
		const paso = 3
		const nuevaPos = direccion.siguientes(position, paso)
		position = game.at(self.nuevoX(nuevaPos.x()), self.nuevoY(nuevaPos.y()))
		game.say(self, "x: " + position.x() + " y:" + position.y())
	}
	
	method nuevoX(xAMover){
		return xAMover.max(tablero.coordenadaInicial().x()).min(tablero.coordenadaFinal().x())
	}
	
	method nuevoY(yAMover){
		return yAMover.max(tablero.coordenadaInicial().y()).min(tablero.coordenadaFinal().y())
	}
	
	method ubicarEnPosicionInicial(nuevaPos){
		self.position(nuevaPos)
	}
}

object selectorDePieza {
	// Va a variar de acuerdo al tablero final
	var property position = game.at(6, 0)
	
	method operarConPieza(){
		self.seleccionarPieza()
	}
	
	method seleccionarPieza(){
		self.validarPieza()
		const pieza = game.colliders(self)
		pieza.position(0,0) // va a mover la pieza al tablero principal
	}
	
	method validarPieza(){
		if (game.colliders(self).isEmpty()){
			self.error("No hay pieza para seleccionar")
		}
	}
	
	method otroSelector() = selectorDePosicion
}

object selectorDePosicion{
	
	method operarConPieza() { 
		self.ponerPieza()
	}
	
	// TODO: Ver que se hace cuando se pone la pieza
	// Cuando el jugador ponga la pieza se tiene que validar si se gano el juego y parar el programa
	method ponerPieza(){
		self.otroSelector().position(6,0) // mover al otro selector?
	}
	
	method otroSelector() = selectorDePieza
}
