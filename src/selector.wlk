import wollok.game.*
import tablero.*
import pieza.nullPieza
import quatro.*
import modos.*

object selector{
	var property position = quatro.tableroActual().coordenadaInicial()
	var property state = libre
	
	method image() = "selector.png"
	
	method mover(direccion){
		state.mover(direccion)
	}
	
	method operarConPieza(){
		state.operarConPieza()
	}
	
	method ponerPieza(){
		position = quatro.coordenadaInicial()
		state = libre
	}
}
