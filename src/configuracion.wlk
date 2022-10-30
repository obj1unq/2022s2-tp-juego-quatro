import wollok.game.*
import direcciones.*
import selector.*
import quatro.*

object configuracion {
	
	method configurarTeclas(){
		keyboard.left().onPressDo( { selector.mover(izquierda) }  )
		keyboard.right().onPressDo( { selector.mover(derecha) }  )
		keyboard.up().onPressDo( { selector.mover(arriba) }  )
		keyboard.down().onPressDo( { selector.mover(abajo) }  )
		keyboard.p().onPressDo( { quarto.ponerPieza()})
		keyboard.enter().onPressDo({quarto.seleccionarPieza()})
	}	
	
}
