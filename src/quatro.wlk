import selector.*

// Quatro seria nuestro main Character, ya que sabe cual es el selector a utilizar en el juego
object quatro {
	var property filas = #{}
	var selector = selectorDePieza
	
	method hayFilaGanadora(){
		return filas.any({ fila => fila.esVictoria() })
	} 
	
	method cambiarSelector(){
		selector.operarConPieza()
		selector = selector.otroSelector()
	}
	
}
