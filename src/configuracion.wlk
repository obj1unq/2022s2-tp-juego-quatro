import wollok.game.*
import pieza.*
import direcciones.*

object pepita{
	var property position = game.at(25,4)
	method image() = "pepita.png"
	
	method mover(direccion){
		const paso = 3
		position = direccion.siguientes(position, paso)
	}
}

object configuracion {
	const pieza1 = new Pieza()
	const pieza2 = new Pieza()
	const pieza3 = new Pieza()
	const pieza4 = new Pieza()
	const pieza5 = new Pieza()
	const pieza6 = new Pieza()
	const pieza7 = new Pieza()
	const pieza8 = new Pieza()
//	const pieza9 = new Pieza()
//	const pieza10 = new Pieza()
//	const pieza11 = new Pieza()
//	const pieza12 = new Pieza()
//	const pieza13 = new Pieza()
//	const pieza14 = new Pieza()
//	const pieza15 = new Pieza()
//	const pieza16 = new Pieza()
	
	method pieza() = pieza4
	
	method configurarPiezas(){ 
		pieza1.caracteristicas([blanca, lisa, cuadrada, baja])
		pieza2.caracteristicas([blanca, lisa, cilindrica, baja])
		pieza3.caracteristicas([blanca, lisa, cuadrada, alta])
		pieza4.caracteristicas([blanca, lisa, cilindrica, alta])
		pieza5.caracteristicas([blanca, tallada, cilindrica, baja])
		pieza6.caracteristicas([blanca, tallada, cuadrada, baja])
		pieza7.caracteristicas([blanca, tallada, cilindrica, alta])
		pieza8.caracteristicas([blanca, tallada, cuadrada, alta])
//		pieza9.caracteristicas([negra, lisa, cuadrada, baja])
//		pieza10.caracteristicas([negra, lisa, cilindrica, baja])
//		pieza11.caracteristicas([negra, lisa, cuadrada, alta])
//		pieza12.caracteristicas([negra, lisa, cilindrica, alta])
//		pieza13.caracteristicas([negra, tallada, cilindrica, baja])
//		pieza14.caracteristicas([negra, tallada, cuadrada, baja])
//		pieza15.caracteristicas([negra, tallada, cilindrica, alta])
//		pieza16.caracteristicas([negra, tallada, cuadrada, alta])
	}
		
	method agregarVisualizaciones(){
		game.addVisual(pieza1)
		game.addVisual(pieza2)
		game.addVisual(pieza3)
		game.addVisual(pieza4)
		game.addVisual(pieza5)
		game.addVisual(pieza6)
		game.addVisual(pieza7)
		game.addVisual(pieza8)
		game.addVisual(pepita)
	}
	
	method ubicarPiezas(){
		pieza1.position(game.at(25,4))
		pieza2.position(game.at(28,4))
		pieza3.position(game.at(31,4))
		pieza4.position(game.at(34,4))
		pieza5.position(game.at(25,7))
		pieza6.position(game.at(28,7))
		pieza7.position(game.at(31,7))
		pieza8.position(game.at(34,7))
		
	}
	
	method configurarTeclas(){
		keyboard.left().onPressDo( { pepita.mover(izquierda) }  )
		keyboard.right().onPressDo( { pepita.mover(derecha) }  )
		keyboard.up().onPressDo( { pepita.mover(arriba) }  )
		keyboard.down().onPressDo( { pepita.mover(abajo) }  )
	}	
	
}
