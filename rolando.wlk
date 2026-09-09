object rolando {
 
    const mochila = []

    const hogar = castillo

    const historialDeEncuentros = []

    var poderBase = 5

    var poderPelea = 0

    //var batallasPeleadas = 0               // me interesa saber las batallas peleadas?

    var capacidadMochila = 2

    
    method encontrarArtefacto(artefacto){
        historialDeEncuentros.add(artefacto)
        if (mochila.size() < capacidadMochila) {
            mochila.add(artefacto)
        }
    }

    
    method mochila(){
        return mochila
    }


    method llegarAHogar(){
        hogar.almacen().addAll(self.mochila())
        mochila.clear()
    }


    method posesiones(){
        return hogar.almacen() + self.mochila()  // aca no se puede usar un addAll porque no se puede usar una orden en un return.
    }


    method poseeArtefacto(artefacto){
        return self.posesiones().contains(artefacto)
    }


    method historialDeEncuentros(){
        return historialDeEncuentros
    }


    method poderPelea(){
        return poderBase + mochila.sum({artefacto => artefacto.poderPelea(self)})
    }


    method poderBase(){
        return poderBase
    }
    

    method pelear(){
        poderBase += 1
        mochila.forEach({artefacto => artefacto.incrementarUsos()}) 
        if (self.poseeArtefactoEncima(libro)) {
            libro.eliminarHechizo()
        }
    //    batallasPeleadas += 1    
    }


    method capacidadMochila(){
        return capacidadMochila
    }


    method capacidadMochila(capacidad){
        capacidadMochila = capacidad
    }


    method artefactoMasPoderoso(){
        return self.posesionesHogar().max({artefacto => artefacto.poderPelea(self)})
    } 


    method posesionesHogar(){
        return hogar.almacen()
    } 


    method poseeArtefactoEncima(artefacto){
        return self.mochila().contains(artefacto)
    }

}







object espada {

    var vecesUsado = 0


    method poderPelea(personaje){
        if (vecesUsado < 1){
            return personaje.poderBase()
        } else {
            return personaje.poderBase() / 2
        }
    }


    method vecesUsado(){              
        return vecesUsado
    }


    method incrementarUsos(){
        vecesUsado += 1
    }
}






object collar {

    var vecesUsado = 0


    method poderPelea(personaje){
        if (personaje.poderBase() <= 6){
            return 3
        } else {
            return 3 + vecesUsado
        }
    }


    method vecesUsado(){
        return vecesUsado
    }


    method incrementarUsos(){
        vecesUsado += 1
    }

}






object armadura {

    var vecesUsado = 0                     // a la armadura no le importa cuantas veces fue usada, no se desgasta, pero el metodo de rolando pelar() incrementa en 1 las veces que el artefacto fue usadao, entonces asumo que este metodo tiene que estar aca, o si no lo pongo no hace nada? (y no rompe). RESPUESTA: Sí, rompe. Es comun a todos los objetos, asi que hay que ponerlo.

    method poderPelea(personaje){          
        return 6
    }


    method vecesUsado(){
        return vecesUsado
    }


    method incrementarUsos(){
        vecesUsado += 1
    }
}






object libro {

    const hechizos = []     // tengo que hacer esto despues: Luego de utilizar un hechizo, éste se descarta.

    var vecesUsado = 0  


    method poderPelea(personaje){          
        if (hechizos.isEmpty()) {
            return 0
        } else {
            return hechizos.first().poderPelea(personaje)  
        }
    }


    method vecesUsado(){
        return vecesUsado
    }


    method incrementarUsos(){
        vecesUsado += 1
    }


    method hechizos(){
        return hechizos
    }


    method eliminarHechizo(){
        if (not hechizos.isEmpty()) {
            hechizos.remove(hechizos.first())
        }
    }
}





object bendicion {

    var poderPelea = 4


    method poderPelea(personaje){
        return poderPelea
    }
}




object invisibilidad {

    method poderPelea(personaje){
        return personaje.poderBase()
    }
}




object invocacion {      //chequear que el artefacto del castillo no sufre ningún efecto por la batalla

    method poderPelea(personaje){
        return personaje.artefactoMasPoderoso().poderPelea(personaje)  //asegurarse que todos los personajes sepan su artefacto mas poderoso
    }
}




object castillo {

    const almacen = []


    method almacen(){
        return almacen
    }
}


//ME QUEDÉ EN 2.2, TENGO QUE HACER LOS TESTS.