import tablero.*

class Jugador{
	var property piezas = #{}
	var property tableroRival =  tableroQuatro
	
	method removerPieza(pieza) {
		piezas.remove(pieza)
	}
	
	method sinFichas() {
		return piezas.isEmpty()
	}
	
	method add(pieza){
		piezas.add(pieza)
	}
}

object jugadorBlanco inherits Jugador{
	method iniciar(){
		tableroRival = tableroNegras
	}
	
	method jugadorRival() = jugadorNegro
	
	method nombre() = "blanco"
}

object jugadorNegro inherits Jugador{
	method iniciar(){
		tableroRival = tableroBlancas
	}
	
	method jugadorRival() = jugadorBlanco
	method nombre() = "negro"
}