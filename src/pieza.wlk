import wollok.game.*

class Pieza {
	// TODO: validar que siempre esten ordenadas de la misma forma, mas que todo para las imagenes
	// pieza_ color altura forma relleno
	var caracteristicas = []
	const tamanioDeCaracteristicas = 4
	var position = game.at(0,0)
	var property target = null
	
	method caracteristicas(){
		return caracteristicas
	}
	
	method position(){
		return if (target != null) target.position() else position
	}
	method position(_position){
		position = _position
	}
	
	method caracteristicas(_caracteristicas){
		self.validarCaracteristicas(_caracteristicas)
		caracteristicas = _caracteristicas
	}
	
	method validarCaracteristicas(_caracteristicas){
		if (_caracteristicas.size() != tamanioDeCaracteristicas){
			self.error("No puedo tener menos de" + tamanioDeCaracteristicas +  "caracteristicas")
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
	method caracteristicas() = []
	method image() {}
	method caracteristicasOrdenadas() {}
	
}