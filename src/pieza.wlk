import wollok.game.*

class Pieza {
	var caracteristicas = []
	const tamanioDeCaracteristicas = 4
	var property position = game.at(0,0)
	
	method caracteristicas(){
		return caracteristicas
	}
	
	method caracteristicas(_caracteristicas){
		self.validarCaracteristicas(_caracteristicas)
		caracteristicas = _caracteristicas
	}
	
	method validarCaracteristicas(_caracteristicas){
		if (_caracteristicas.size() != tamanioDeCaracteristicas){
			self.error("El tamaño debe ser de " + tamanioDeCaracteristicas +  " caracteristicas")
		}
	}
	
	method image(){
		return "quatro-" + self.nombreDeCaracteristicas().join("-") + ".png"
	}
	
	method caracteristicasOrdenadas(){
		return caracteristicas.sortedBy({ c1, c2 => c1.orden() < c2.orden() })	
	}
	
	method nombreDeCaracteristicas(){
		return self.caracteristicasOrdenadas().map({caracteristica => caracteristica.nombre()})
	}
}

object nullPieza {
	method position() = game.at(0, 0)
	method position(_position) {}
	method caracteristicas() = []
	method image() {}
	method caracteristicasOrdenadas() {}
	
}