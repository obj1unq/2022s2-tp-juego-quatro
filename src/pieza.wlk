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
}


object negra{}

object blanca{}

object lisa{}

object tallada{}

object cuadrada{}

object cilindrica{}

object alta{}

object baja{}