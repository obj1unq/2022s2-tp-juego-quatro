import tablero.*

class Jugador{
	var property piezas = #{}
	var property tableroRival =  tableroQuatro
		
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