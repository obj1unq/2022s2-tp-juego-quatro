import tablero.*

class Jugador{
	var property piezas = #{}
	var property otroTablero =  tableroQuatro
		
}

object jugadorBlanco inherits Jugador{
	method iniciar(){
		otroTablero = tableroNegras
	}
	
	method otroJugador() = jugadorNegro
}

object jugadorNegro inherits Jugador{
	method iniciar(){
		otroTablero = tableroBlancas
	}
	
	method otroJugador() = jugadorBlanco
}