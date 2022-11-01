import wollok.game.*
import tablero.*
import pieza.nullPieza
import quatro.*

object selector{
	var property position = quarto.tableroActual().coordenadaInicial()
	var property piezaActual = nullPieza
	
	method image() = "selector.png"
	
	method mover(direccion){
		const paso = 3
		const nuevaPos = direccion.siguientes(position, paso)
		position = game.at(self.nuevoX(nuevaPos.x()), self.nuevoY(nuevaPos.y()))
	}
	
	method nuevoX(xAMover){
		return xAMover.max(quarto.tableroActual().ejeXMinimo()).min(quarto.tableroActual().ejeXMaximo())
	}
	
	method nuevoY(yAMover){
		return yAMover.max(quarto.tableroActual().ejeYMinimo()).min(quarto.tableroActual().ejeYMaximo())
	}
	
	method seleccionarPieza(){
		piezaActual = game.colliders(self).first()
		piezaActual.target(self)
		self.position(quarto.tableroActual().coordenadaInicial())
	}
	
	method ponerPieza(){
		piezaActual.position(position)
		piezaActual.target(null)
		piezaActual = nullPieza
	}
}
