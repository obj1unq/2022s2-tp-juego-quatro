import tablero.*

class Jugador{
	var property piezas = #{}
	var property tableroRival =  tableroQuatro
	var cantidadPiezas = 8
	
	method restarUnaPiezaAlPoner() {
		cantidadPiezas -= 1
	}
	
	method cantidadPiezas() {
		return cantidadPiezas
	}
	
	method sinFichas() {
		return cantidadPiezas == 0
	}
}

object jugadorBlanco inherits Jugador{
	method iniciar(){
		tableroRival = tableroNegras
	}
	
	method jugadorRival() = jugadorNegro
}

object jugadorNegro inherits Jugador{
	method iniciar(){
		tableroRival = tableroBlancas
	}
	
	method jugadorRival() = jugadorBlanco
}