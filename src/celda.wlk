import wollok.game.*
import pieza.nullPieza

class Celda{
	var property position = game.at(0, 0)
	// contenido es null o una instancia de pieza
	var property contenido = nullPieza
	
	method image() = "celdaVacia.png"
	method caracteristicas(){
		return contenido.caracteristicas().asSet() 
	}	
}

