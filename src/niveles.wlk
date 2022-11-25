import quatro.*
import tablero.*
import jugador.*
import selector.*
import configuracion.*

import wollok.game.*

class Nivel{
	
	const position = game.at(4,22)
	
	method iniciar(){
		tableroQuatro.iniciarCoordenadas()
		tableroNegras.iniciarCoordenadas()
		tableroBlancas.iniciarCoordenadas()
		jugadorBlanco.iniciar()
		jugadorNegro.iniciar()
		configuracion.configurarTeclas()
		quatro.iniciar()
	}
	
	method sumarVictoria(jugador)
	method mensajeDelFin(jugador){
		return if (quatro.hayFilaGanadora()) "ganadore-" + self.jugadorGanador(jugador) else "empate"
	}
	
	method jugadorGanador(jugador)
	method victoriasRequeridas()
	method siguiente()
	method tipoDeJuego()
	method image() = "quatro-modo-" + self.tipoDeJuego() + ".png"
	method position() = position
}

object nivel1 inherits Nivel{
	
	override method sumarVictoria(jugador){
		jugador.sumarVictoria()
	}

	override method jugadorGanador(jugador){
		return jugador.nombre()
	}
	
	override method victoriasRequeridas(){
		return 2
	}
	
	override method siguiente(){
		return nivel2
	}
	override method tipoDeJuego(){
		return "clasico"
	}
	
}

object nivel2 inherits Nivel{
	
	override method sumarVictoria(jugador){
		jugador.jugadorRival().sumarVictoria()
	}
	
	override method jugadorGanador(jugador){
		return jugador.jugadorRival().nombre()
	}
	
	override method victoriasRequeridas(){
		return 4
	}
	
	override method siguiente(){
		return #{nivel1,self}.anyOne()
	}
	override method tipoDeJuego(){
		return "opuesto"
	}
}

