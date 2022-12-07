import selector.*
import wollok.game.*
import pieza.nullPieza
import quatro.*
import tablero.*

class Modo{
	var nuevaPosicion = game.at(0, 0)
	
	method nuevaPosicion() = nuevaPosicion
	
	method mover(direccion){
		const paso = 3
		nuevaPosicion = direccion.siguientes(selector.position(), paso)
		selector.position(direccion.avanzar(nuevaPosicion))
	}
}


object libre inherits Modo{
	
	method validarSeleccionar(){
		if (not quatro.puedeSeleccionar()){
			selector.error("No se puede realizar esta accion")
		}
	}
	
	method operarConPieza(){
		self.validarSeleccionar()
		
		quatro.seleccionarPieza()
		seleccionado.seleccionarPieza()
	}
}


object seleccionado inherits Modo{
	var property pieza = nullPieza
	
	method seleccionarPieza(){
		pieza = game.colliders(selector).first()
		quatro.jugadorActual().removerPieza(pieza)
		selector.position(quatro.tableroActual().coordenadaInicial())
		pieza.position(selector.position())
		selector.state(self)
	}
	
	override method mover(direccion){
		super(direccion)
		pieza.position(direccion.avanzar(self.nuevaPosicion()))
	}
	
	method validarPoner(){
		if (not quatro.puedePoner()){
			selector.error("No se puede realizar esta accion")
		}
	}
	
	method operarConPieza(){
		self.validarPoner()
		self.ponerPiezaEnCelda()
		pieza = nullPieza
		quatro.ponerPieza()
		selector.ponerPieza()
	}
	
	method ponerPiezaEnCelda(){
		var colisiones = game.colliders(selector)
		colisiones.remove(pieza)
		const celda = colisiones.first()
		celda.contenido(pieza)
	}
}