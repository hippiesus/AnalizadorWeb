package modelo

class DefectoProgramas implements Serializable {
    int numeroLinea
    Programa programa
    Defecto defecto

    static constraints = {
    }
    static belongsTo=[Programa,Defecto]
    static mapping = {
        version false
        id composite:['defecto','programa','numeroLinea'], generator:'assigned'
    }
    def String toString() {
        return numeroLinea+" "+programa.getNombre()+" "+defecto.getNombre()
    }
}
