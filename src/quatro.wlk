import selector.*
import jugador.*
import tablero.tableroQuatro

object quatro {
	var property filas = #{}
	var jugadorActual = jugadorBlanco
	var tableroActual = tableroQuatro
	
	method hayFilaGanadora(){
		return filas.any({ fila => fila.esVictoria() })
	} 
	
	method ponerPieza(){
		self.validarTablero(jugadorActual)
		//selector.poner()
		jugadorActual = jugadorActual.otroJugador()
		tableroActual = jugadorActual.otroTablero()
		selector.tablero(tableroActual)
		selector.position(tableroActual.coordenadaInicial())
	}
	
	// Esta bien este validar?
	method validarTablero(jugador){
		if (tableroActual != tableroQuatro){
			self.error("No se puede poner en este tablero")
		}
	}
//	method cambiarSelector(){
//		selectorActual.operarConPieza()
//		selectorActual = selector.otroSelector()
//	}
	
}
