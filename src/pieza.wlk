class Pieza {
	// TODO: validar que siempre esten ordenadas de la misma forma, mas que todo para las imagenes
	// pieza_ color altura forma relleno
	var caracteristicas = []
	const tamanioDeCaracteristicas = 4
	
	method caracteristicas(){
		return caracteristicas
	}
	
	method caracteristicas(_caracteristicas){
		self.validarCaracteristicas(_caracteristicas)
		caracteristicas = _caracteristicas
	}
	
	method validarCaracteristicas(_caracteristicas){
		if (_caracteristicas.size() != tamanioDeCaracteristicas){
			self.error("No puedo tener menos de 4 caracteristicas")
		}
	}
	
	method image(){
		return "quatro-" + self.caracteristicasOrdenadas().join("-") + ".png"
	}
	
	method caracteristicasOrdenadas(){
		return caracteristicas.sortedBy({ c1, c2 => c1.orden() < c2.orden() })	
	}
}

object nullPieza {
	method caracteristicas() = []
	method image() {}
	method caracteristicasOrdenadas() {}
	
}

class Caracteristica {
	method orden()
	method nombre()
}


class Color inherits Caracteristica {
	override method orden() = 1
}

class Aspecto inherits Caracteristica{
	override method orden() = 2
}

class Forma inherits Caracteristica{
	override method orden() = 3
}

class Altura inherits Caracteristica{
	override method orden() = 4
}

object negra inherits Color{
	override method nombre() = "negra"
}

object blanca inherits Color{
	override method nombre() = "blanca"
}

object lisa inherits Aspecto {
	override method nombre() = "lisa"
}

object tallada inherits Aspecto {
	override method nombre() = "tallada"
}

object cuadrada inherits Forma{
	override method nombre() = "cuadrada"
}

object cilindrica inherits Forma{
	override method nombre() = "cilindrica"
}

object alta inherits Altura{
	override method nombre() = "alta"
}

object baja inherits Altura{
	override method nombre() = "baja"
}