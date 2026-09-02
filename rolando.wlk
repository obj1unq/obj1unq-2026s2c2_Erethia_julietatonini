object rolando {
 
    const mochila = []

    const hogar = castillo

    
    method encontrarArtefacto(artefacto){
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