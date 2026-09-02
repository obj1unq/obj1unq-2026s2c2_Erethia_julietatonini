object rolando {
 
    const mochila = []

    
    method encontrarArtefacto(artefacto){
        if (mochila.size() < 2) {
            mochila.add(artefacto)
        }
    }

    
    method mochila(){
        return mochila
    }


    method llegarAHogar(castillo){
        castillo.almacen().addAll(self.mochila())
        mochila.clear()
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