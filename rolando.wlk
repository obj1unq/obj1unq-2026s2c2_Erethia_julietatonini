object rolando {
 
    const mochila = []

    const hogar = castillo

    const historialDeEncuentros = []

    
    method encontrarArtefacto(artefacto){
        historialDeEncuentros.add(artefacto)
        if (mochila.size() < 2) {
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
        return hogar.almacen() + self.mochila()  
    }


    method poseeArtefacto(artefacto){
        return self.posesiones().contains(artefacto)
    }


    method historialDeEncuentros(){
        return historialDeEncuentros
    }
    
}






object espada {

}




object libro {

}



object collar {

}




object armadura {

}



object castillo {

    const almacen = []


    method almacen(){
        return almacen
    }
}