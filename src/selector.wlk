import wollok.game.*

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
