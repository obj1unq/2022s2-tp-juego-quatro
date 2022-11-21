# Quatro

2S 2022 - Programación con Objetos I 

## Equipo de desarrollo

- Carro, Nahuel Agustín
- Cortizas, Margarita
- Jacobsen, Martín Ángel
- Martínez, Lucas Javier


## Capturas
[![quatro-estado-inicial-juego.png](https://i.postimg.cc/59sRx33W/quatro-estado-inicial-juego.png)](https://postimg.cc/s1Zcm5qT)
Estado Inicial del Juego - Quatro

[![quatro-ganador-blanco.png](https://i.postimg.cc/fy17VJym/quatro-ganador-blanco.png)](https://postimg.cc/hQbQw49t)
Jugador Blanco Ganador

[![quatro-juego-empatado.png](https://i.postimg.cc/wj2VVxG8/quatro-juego-empatado.png)](https://postimg.cc/JsyZ788P)
Empate del Juego

## Reglas de Juego / Instrucciones

El Quatro es un juego abstracto de estrategia por turnos para dos personas, creado por el matemático suizo Blaise Muller. Es conceptualmente muy sencillo, pero tiene una enorme cantidad de posibilidades. 
Las 16 piezas del juego tienen 4 atributos distintos: -altura (alta o baja), color (blanca o negra), forma (cilíndrica o cuadrada) y aspecto (lisa o tallada) . El objetivo del juego en la modalidad clásica es alinear 4 piezas con al menos una característica común, en la opuesta... todo lo contrario. El problema es que uno no elige las piezas que va a jugar,  ¡tu rival las elige por vos!

## Modalidades del Juego
- El Juego finaliza una vez que un jugador realiza 3 victorias.
- Para colocar y seleccionar las piezas del rival en el tablero se utiliza la tecla ENTER.
- Para reiniciar cada partida se utiliza la tecla R. 
- Hay dos modalidades de Juego, Clásica y Opuesta. 
El juego comienza en modalidad Clásica, donde el objetivo del juego es alinear 4 piezas con al menos una característica común. Luego de 2 victorias, la modalidad se modifica a Opuesta. Donde el objetivo del juego es totalmente lo contrario, la finalidad es que tu rival realice una alineación de 4 piezas con al menos una característica común. Luego de 4 partidas, 2 victorias para cada jugador, la modalidad de la partida definitiva se determina de manera random.

## Composición

El juego se compone de:
- Un tablero de 16 casillas (4*4)
- 16 peones diferenciables por 4 características:

- El color - blanca / negra
- La altura - alta / baja
- El aspecto - lisa / tallada
- La forma - cuadrada / cilíndrica

Todas las combinaciones (ejemplo: grande, clara, agujereada y cilíndrica) están representadas, y una sola vez cada una.

## Otros

- Curso/Facultad
- Versión de wollok
- Una vez terminado, no tenemos problemas en que el repositorio sea público.
