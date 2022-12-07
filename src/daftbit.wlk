import wollok.game.*

object daftBit{
	const cancion = game.sound("get-Lucky-8Bits.mp3")
	var volumen = 0.2
	const pasoDelVolumen = 0.2
	
	method bajarVolumen(){
		volumen = (volumen - pasoDelVolumen).max(0)
		cancion.volume(volumen)
	}
	
	method subirVolumen(){
		volumen = (volumen + pasoDelVolumen).min(1)
		cancion.volume(volumen)
	}
	
	method play(){
		cancion.shouldLoop(true)
		cancion.volume(volumen)
		cancion.play()
	}
	
	method pause(){
		cancion.pause()
	}
	
	method resume(){
		cancion.resume()
	}
	
	method stop(){
		cancion.stop()
	}
}