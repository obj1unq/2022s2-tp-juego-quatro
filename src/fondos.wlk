import wollok.game.*

object fondoPortada {

	var property position = game.at(20, 11)
	var property estado = ""

	method image() = "quatro-" + estado + ".png"

}

object fondoInstrucciones {
	
	var property modo = manualEnPantalla
	var property position = game.at(2, 2)
	
	method image() = "quatro-instrucciones.png"
	
	method showHide() {
		modo.showHide()
	}
	
	method show() {
		game.addVisual(self)
		modo = modo.modoContrario()
	}
	
	method hide() {
		game.removeVisual(self)
		modo = modo.modoContrario()
	}
	
}

object manualEnPantalla {
	
	method showHide() {
		fondoInstrucciones.show()
	}
	
	method modoContrario() {
		return manualEscondido
	}
	
}

object manualEscondido {
	
	method showHide() {
		fondoInstrucciones.hide()
	}
	
	method modoContrario() {
		return manualEnPantalla
	}
	
}