// Va a haber 10 filas que son las posibles ganadoras
class Fila{
	var celdas = #{}
	const tamanioDeCelda = 4
	
	method celdas(_celdas){
		self.validarCeldas(_celdas)
		celdas = _celdas
	}
	
	method validarCeldas(_celdas){
		if (_celdas.size() != tamanioDeCelda){
			self.error("No puedo tener menos de 4 celdas")
		}
	}
	
	//Revisa que tenga 4 celdas con piezas
	method esFilaCompleta() {
		return celdas.all({celda => not celda.caracteristicas().isEmpty()})
	}
	
	// Revisa que tengan una caracteristica en comun las 4 celdas
	// y que la fila sea completa
	method esVictoria() {
		return self.esFilaCompleta() and self.tienenCaracteristicaComun()
	}
	
	method tienenCaracteristicaComun(){
		return not self.caracteristicasEnComun().isEmpty()
	}
	
	method caracteristicasEnComun(){
		return celdas.fold(self.caracteristicasAlgunaCelda(), {c1, c2 => c1.intersection(c2.caracteristicas())})
	}
	
	method caracteristicasAlgunaCelda() = celdas.anyOne().caracteristicas()
	
}