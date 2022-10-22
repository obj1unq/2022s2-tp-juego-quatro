
class Fila{
	var property celdas = #{}
	
	//Revisa que tenga 4 celdas con piezas
	method esFilaCompleta() {
		return celdas.all({celda => !celda.caracteristicas().isEmpty()})
	}
	
	// Revisa que tengan una caracteristica en comun las 4 celdas
	// y tiene como precondicion que la fila sea completa
	method esVictoria() {}
}