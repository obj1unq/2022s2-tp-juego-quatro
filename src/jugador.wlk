import quatro.*
import tablero.*
import wollok.game.*

class Jugador{
	var property piezas = #{}
	var property tableroRival =  tableroQuatro
	var victorias = 0
	
	method victorias() = victorias
	
	method sumarVictoria() {
		if (quatro.hayFilaGanadora()){
			victorias += 1
		}
	}
	method esGanador(){
		return victorias == 3
	}
	
	method removerPieza(pieza) {
		piezas.remove(pieza)
	}
	
	method sinFichas() {
		return piezas.isEmpty()
	}
	
	method add(pieza){
		piezas.add(pieza)
	}
	
	method jugadorRival()
	
	method puedePasarDeNivel(nivel){
		return victorias + self.jugadorRival().victorias() == nivel.victoriasRequeridas()
	}
}

object jugadorBlanco inherits Jugador{
	method iniciar(){
		tableroRival = tableroNegras
	}
	
	override method jugadorRival() = jugadorNegro
	
	method nombre() = "blanco"
}

object jugadorNegro inherits Jugador{
	method iniciar(){
		tableroRival = tableroBlancas
	}
	
	override method jugadorRival() = jugadorBlanco
	method nombre() = "negro"
}