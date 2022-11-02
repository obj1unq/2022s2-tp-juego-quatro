import quatro.*
import tablero.*
import jugador.*
import selector.*
import direcciones.*

import wollok.game.*

object configuracion {
	
	method configurarTeclas(){
		keyboard.left().onPressDo( { selector.mover(izquierda) }  )
		keyboard.right().onPressDo( { selector.mover(derecha) }  )
		keyboard.up().onPressDo( { selector.mover(arriba) }  )
		keyboard.down().onPressDo( { selector.mover(abajo) }  )
		keyboard.enter().onPressDo( {quatro.operarConPieza()} )
	}	
	
}

object nivel1{
	method iniciar(){
		tableroQuatro.iniciarCoordenadas()
		tableroNegras.iniciarCoordenadas()
		tableroBlancas.iniciarCoordenadas()
		jugadorBlanco.iniciar()
		jugadorNegro.iniciar()
		quatro.iniciar()
		configuracion.configurarTeclas()
	}
}