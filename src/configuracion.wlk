import quatro.*
import tablero.*
import jugador.*
import daftbit.*
import selector.*
import direcciones.*
import wollok.game.*
import fondos.*

object configuracion {
	
	method configurarTeclas(){
		keyboard.left().onPressDo( { selector.mover(izquierda) }  )
		keyboard.right().onPressDo( { selector.mover(derecha) }  )
		keyboard.up().onPressDo( { selector.mover(arriba) }  )
		keyboard.down().onPressDo( { selector.mover(abajo) }  )
		keyboard.enter().onPressDo( {quatro.operarConPieza()} )
		keyboard.minusKey().onPressDo({daftBit.bajarVolumen()})
		keyboard.plusKey().onPressDo({daftBit.subirVolumen()})
		keyboard.p().onPressDo({daftBit.pause()})
		keyboard.space().onPressDo({daftBit.resume()})
		keyboard.s().onPressDo({daftBit.stop()})
		keyboard.i().onPressDo({fondoInstrucciones.showHide()})
	}
	
	
}


class Visor{
	method jugador()
	
	method image() = "quatro-" + self.jugador().victorias() + ".png"
}

object visorBlancoVictorias inherits Visor{
	override method jugador() = jugadorBlanco

	method position() {
		return game.at(34,12)
	}
	
}

object visorNegroVictorias inherits Visor{
	override method jugador() = jugadorNegro
	
	method position() {
		return game.at(34,21)
	}
	
}