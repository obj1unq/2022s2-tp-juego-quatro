import selector.*
import jugador.*
// Quatro seria nuestro main Character, ya que sabe cual es el selector a utilizar en el juego
// Quatro tiene el jugador actual, jugador 1 y 2 son objetos
// Cada jugador hereda de una clase jugadorBase, cada jugador tendria un metodo seleccionar tablero rival
// cada casillero de pieza es un objeto que tendria las posiciones x e y maximas????
// cuando se haga enter, el objeto quatro va a cambiar de jugador, seleccionar la pieza actual (donde esta parado)
// y llevarla al tablero principal, cuando se vuelva a hacer enter (o p) se pone la pieza y cambia de nuevo el
// jugador
object quatro {
	var property filas = #{}
	const selectorActual = selector
	var jugadorActual = jugadorBlanco
	
	method hayFilaGanadora(){
		return filas.any({ fila => fila.esVictoria() })
	} 
	
	method ponerPieza(){
		//selector.poner()
		jugadorActual = jugadorActual.otroJugador()
		selectorActual.tablero(jugadorActual.otroTablero())
		selectorActual.ubicarEnPosicionInicial(jugadorActual.otroTablero().coordenadaInicial())
	}
	
//	method cambiarSelector(){
//		selector.operarConPieza()
//		selector = selector.otroSelector()
//	}
	
}
