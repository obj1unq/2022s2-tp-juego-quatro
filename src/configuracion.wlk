import wollok.game.*
import pieza.*

object configuracion {
	const pieza1 = new Pieza()
//	const pieza2 = new Pieza()
//	const pieza3 = new Pieza()
//	const pieza4 = new Pieza()
//	const pieza5 = new Pieza()
//	const pieza6 = new Pieza()
//	const pieza7 = new Pieza()
//	const pieza8 = new Pieza()
//	const pieza9 = new Pieza()
//	const pieza10 = new Pieza()
//	const pieza11 = new Pieza()
//	const pieza12 = new Pieza()
//	const pieza13 = new Pieza()
//	const pieza14 = new Pieza()
//	const pieza15 = new Pieza()
//	const pieza16 = new Pieza()
	
	method configurarPiezas(){ 
		pieza1.caracteristicas([blanca, lisa, cuadrada, baja])
//		pieza2.caracteristicas([blanca, lisa, cilindrica, baja])
//		pieza3.caracteristicas([blanca, lisa, cuadrada, alta])
//		pieza4.caracteristicas([blanca, lisa, cilindrica, alta])
//		pieza5.caracteristicas([blanca, tallada, cilindrica, baja])
//		pieza6.caracteristicas([blanca, tallada, cuadrada, baja])
//		pieza7.caracteristicas([blanca, tallada, cilindrica, alta])
//		pieza8.caracteristicas([blanca, tallada, cuadrada, alta])
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
//		game.addVisual(pieza2)
//		game.addVisual(pieza3)
//		game.addVisual(pieza4)
//		game.addVisual(pieza5)
//		game.addVisual(pieza6)
//		game.addVisual(pieza7)
//		game.addVisual(pieza8)
//		
	}
	
	method ubicarPiezas(){
		pieza1.position(game.at(26,5))
//		pieza2.position(game.at(29,5))
//		pieza3.position(game.at(32,5))
//		pieza4.position(game.at(35,5))
//		pieza5.position(game.at(26,8))
//		pieza6.position(game.at(29,8))
//		pieza7.position(game.at(32,8))
//		pieza8.position(game.at(35,8))
		
	}

	
	
}
