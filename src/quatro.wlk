import fila.*
import celda.*
import pieza.*
import jugador.*
import tablero.*
import selector.*
import configuracion.*
import caracteristicas.*
import niveles.*
import wollok.game.*

object fondoPortada {

	var property position = game.at(20, 11)
	var property estado = ""

	method image() = "quatro-" + estado + ".png"

}

object quatro {
	var property filas = #{}
	var property jugadorActual = jugadorBlanco
	var property tableroActual = jugadorActual.tableroRival()
	const piezas = (1..16).map( { n=> new Pieza() } )
	const celdas = (1..16).map( { n=> new Celda() } )
	var indice = 0
	var nivel = nivel1
	
	method celdas() = celdas
	method verificarSiHayGanador(){
		if (self.hayFilaGanadora() or self.hayEmpate()) {
			nivel.sumarVictoria(jugadorActual)
			self.finalizarJuego(nivel.mensajeDelFin(jugadorActual))
			self.pasarDeNivel()
			self.verificarFinDelJuego()
			self.activarReiniciarJuego()
		}
	}
	
	method coordenadaInicial(){
		return tableroActual.coordenadaInicial()
	}
	method ejeXMinimo(){
		return tableroActual.ejeXMinimo()
	}
	
	method ejeXMaximo(){
		return tableroActual.ejeXMaximo()
	}
	
	method ejeYMinimo(){
		return tableroActual.ejeYMinimo()
	}
	
	method ejeYMaximo(){
		return tableroActual.ejeYMaximo()
	}
	
	method pasarDeNivel(){
		if (jugadorActual.puedePasarDeNivel(nivel)){
			nivel = nivel.siguiente()
		}
	}
	
	method verificarFinDelJuego(){
		if (jugadorActual.esGanador()){
			game.schedule(2000, {game.stop()})
		}
	}
	

	method activarReiniciarJuego(){
		keyboard.r().onPressDo( { game.schedule(500, {self.reiniciarJuego()})} )
	}
	
	method reiniciarJuego(){
		
		game.clear()
		self.iniciar()
		configuracion.configurarTeclas()
		celdas.forEach({celda => celda.vaciarCelda()})
	}
	
	method finalizarJuego(estado){
		game.removeVisual(selector)
		fondoPortada.estado(estado)
		game.addVisual(fondoPortada)
	}

	
	method hayFilaGanadora(){
		return filas.any({ fila => fila.esVictoria() })
	} 
	
	method operarConPieza(){
		selector.operarConPieza()
	}
	
	method hayUnaPieza(){
		return not game.colliders(selector).isEmpty()
	}
	
	method puedeSeleccionar(){
		return self.hayUnaPieza() && tableroActual.puedeSeleccionar()
	}
	
	method puedePoner(){
		return self.puedePonerPieza() && tableroActual.puedePoner()
	}
	
	method puedePonerPieza(){
		return game.colliders(selector).size() == 2
	}
	
	method seleccionarPieza(){
		tableroActual = tableroQuatro
		jugadorActual = jugadorActual.jugadorRival()
	}
	
	method ponerPieza(){
		tableroActual = jugadorActual.tableroRival()
		self.verificarSiHayGanador()
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
		
		(0..7).forEach( {n => jugadorBlanco.add(piezas.get(n)) })
		(8..15).forEach( {n => jugadorNegro.add(piezas.get(n)) })
	}
		
	method agregarVisualizaciones(){
		game.addVisual(selector)
		(0..15).forEach( { n => game.addVisual(piezas.get(n)) } )
		(0..15).forEach( { n => game.addVisual(celdas.get(n) ) } )
	}
	
	//	Posiciona el objeto del indice actual en el eje X: xInicial + 3 * (0..3), y el eje Y dado
	method posicionarAEn(objeto, xInicial, dx, y){
		const paso = 3
		const nuevoX = xInicial + paso * dx
		objeto.get(indice).position(game.at(nuevoX, y))
		indice ++
	}
	
	// Ubica el objeto, en el eje Y va recorriendo la lista y por cada valor X realiza posicionarAEn
	method ubicarAEn(objeto, xInicial, rangoDeY){
		indice = 0
		rangoDeY.forEach( { y => 
			(0..3).forEach( { dx => 
				self.posicionarAEn(objeto, xInicial, dx, y)
			} )
		})
	}
	
	
	method crearFilas(){
		// FilaH es fila horizontal, las celdas 0 al 3 es la celda de abajo de todo y solo cambia el eje X
		const filaH1 = new Fila()
		filaH1.celdas((0..3).map{ n=> celdas.get(n)}.asSet())
		
		const filaH2 = new Fila()
		filaH2.celdas((4..7).map{ n=> celdas.get(n)}.asSet())
		
		const filaH3 = new Fila()
		filaH3.celdas((8..11).map{ n=> celdas.get(n)}.asSet())
		
		const filaH4 = new Fila()
		filaH4.celdas((12..15).map{ n=> celdas.get(n)}.asSet())
		
		////////////////////////////////////////////////////
		// Filas Verticales
		
		const filaV1 = new Fila()
		filaV1.celdas(new Range(start=0,end=12,step=4).map{ n=> celdas.get(n)}.asSet())
		
		const filaV2 = new Fila()
		filaV2.celdas(new Range(start=1,end=13,step=4).map{ n=> celdas.get(n)}.asSet())
		
		const filaV3 = new Fila()
		filaV3.celdas(new Range(start=2,end=14,step=4).map{ n=> celdas.get(n)}.asSet())
		
		const filaV4 = new Fila()
		filaV4.celdas(new Range(start=3,end=15,step=4).map{ n=> celdas.get(n)}.asSet())
		
		////////////////////////////////////////////////////
		// Diagonales
		
		const filaD1 = new Fila()
		filaD1.celdas(new Range(start=0,end=15,step=5).map{ n=> celdas.get(n)}.asSet())
		
		const filaD2 = new Fila()
		filaD2.celdas(new Range(start=3,end=12,step=3).map{ n=> celdas.get(n)}.asSet())
		
		filas = #{filaH1, filaH2, filaH3, filaH4, filaV1, filaV2, filaV3, filaV4, filaD1, filaD2}
	}
	
	method iniciar(){
		game.addVisual(nivel)
		self.configurarPiezas()
		self.agregarVisualizaciones()
		self.ubicarAEn(piezas, 25, [5, 8, 14, 17])
		self.ubicarAEn(celdas, 7, new Range(start=7, end=16, step=3))
		self.crearFilas()
		game.addVisual(visorBlancoVictorias)
		game.addVisual(visorNegroVictorias)
	}
	
	method hayEmpate() {
		return not self.hayFilaGanadora() && jugadorActual.sinFichas() && jugadorActual.jugadorRival().sinFichas()
	}
	
	
}
