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
	
	method hayUnaPieza(){
		return not game.colliders(selector).isEmpty()
	}
	
	method validarSeleccionar(){
		if (quatro.tableroActual() == tableroQuatro or not self.hayUnaPieza()){
			selector.error("No se puede realizar esta accion")
		}
	}
	
	method operarConPieza(){
		self.validarSeleccionar()
		const jugadorActual = quatro.jugadorActual()
		
		quatro.tableroActual(tableroQuatro)
		quatro.jugadorActual(jugadorActual.jugadorRival())
		seleccionado.seleccionarPieza()
		selector.state(seleccionado)
	}
}


object seleccionado inherits Modo{
	var property pieza = nullPieza
	
	method seleccionarPieza(){
		pieza = game.colliders(selector).first()
		selector.position(quatro.tableroActual().coordenadaInicial())
		pieza.position(selector.position())
	}
	
	override method mover(direccion){
		super(direccion)
		pieza.position(direccion.avanzar(self.nuevaPosicion()))
	}
	
	method validarPoner(){
		if (quatro.tableroActual() != tableroQuatro or not self.puedePoner()){
			selector.error("No se puede poner")
		}
	}
	
	method puedePoner(){
		return game.colliders(selector).size() == 1
	}
	
	method operarConPieza(){
		self.validarPoner()
		pieza = nullPieza
		const jugadorActual = quatro.jugadorActual()
		quatro.tableroActual(jugadorActual.tableroRival())
		quatro.verificarSiHayGanador()
		selector.position(quatro.tableroActual().coordenadaInicial())
		selector.state(libre)
	}
}