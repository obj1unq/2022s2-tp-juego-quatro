import wollok.game.*

class Celda{
	var property position = game.at(0, 0)
	// contenido es null o una instancia de pieza
	var property contenido = null
	
	method caracteristicas(){
		return if (contenido != null) contenido.caracteristicas().asSet() else #{} 
	}	
}

