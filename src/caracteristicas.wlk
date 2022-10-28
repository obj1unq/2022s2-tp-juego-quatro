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