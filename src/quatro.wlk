import caracteristicas.*
import pieza.*
import selector.*
import jugador.*
import tablero.*
import wollok.game.*

object quatro {
	var property filas = #{}
	var property jugadorActual = jugadorBlanco
	var property tableroActual = jugadorActual.tableroRival()
	const piezas = (1..16).map( { n=> new Pieza() } )
	var indice = 0
	
	method verificarSiHayGanador(){
		if (self.hayFilaGanadora()){
			game.say(selector, "Winner")
			game.stop()
		}
	}
	
	method hayFilaGanadora(){
		return filas.any({ fila => fila.esVictoria() })
	} 
	
	method operarConPieza(){
		selector.operarConPieza()
		if (self.hayFilaGanadora()){
			game.say(selector, "Winner")
			game.stop()
		}
	}
	
	method configurarPiezas(){ 
		piezas.get(0).caracteristicas([blanca, lisa, cuadrada, baja])
		piezas.get(1).caracteristicas([blanca, lisa, cilindrica, baja])
		piezas.get(2).caracteristicas([blanca, lisa, cuadrada, alta])
		piezas.get(3).caracteristicas([blanca, lisa, cilindrica, alta])
		piezas.get(4).caracteristicas([blanca, tallada, cilindrica, baja])
		piezas.get(5).caracteristicas([blanca, tallada, cuadrada, baja])
		piezas.get(6).caracteristicas([blanca, tallada, cilindrica, alta])
		piezas.get(7).caracteristicas([blanca, tallada, cuadrada, alta])
		piezas.get(8).caracteristicas([negra, lisa, cuadrada, baja])
		piezas.get(9).caracteristicas([negra, lisa, cilindrica, baja])
		piezas.get(10).caracteristicas([negra, lisa, cuadrada, alta])
		piezas.get(11).caracteristicas([negra, lisa, cilindrica, alta])
		piezas.get(12).caracteristicas([negra, tallada, cilindrica, baja])
		piezas.get(13).caracteristicas([negra, tallada, cuadrada, baja])
		piezas.get(14).caracteristicas([negra, tallada, cilindrica, alta])
		piezas.get(15).caracteristicas([negra, tallada, cuadrada, alta])
	}
		
	method agregarVisualizaciones(){
		game.addVisual(selector)
		(0..15).forEach( { n => game.addVisual(piezas.get(n)) } )
	}
	

	// Ubica las piezas, en el eje Y va recorriendo la lista y por cada valor realiza posicionarPieza
	method ubicarPiezas(){
		[5, 8, 14, 17].forEach( { y => 
			(0..3).forEach( { dx => 
				self.posicionarPieza(dx, y)
			} )
		})
	}
	
	//	Posiciona la pieza del indice actual en el eje X: 25 + 3 * (0..3), y el eje Y dado
	method posicionarPieza(dx, y){
		const posInicialX = 25
		const paso = 3
		const nuevoX = posInicialX + paso * dx
		piezas.get(indice).position(game.at(nuevoX, y))
		indice ++
	}
}
