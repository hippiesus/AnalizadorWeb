package modelo

class DefectoProgramas {
    int numeroLinea
    Programa programa
    Defecto defecto

    static constraints = {
    }
    static belongsTo=[Programa,Defecto]
    static mapping = {
        version false
    }
    def String toString() {
        return numeroLinea+" "+programa.getNombre()+" "+defecto.getNombre()
    }
}
