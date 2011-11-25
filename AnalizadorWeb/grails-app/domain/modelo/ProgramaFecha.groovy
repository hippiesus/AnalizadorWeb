package modelo

class ProgramaFecha implements Serializable{
    int cantidadDefectosBajo
    int cantidadDefectosMedio
    int cantidadDefectosCritico
    Fecha fecha
    Programa programa
    static constraints = {
        cantidadDefectosBajo(blank:false)
        cantidadDefectosMedio(blank:false)
        cantidadDefectosCritico(blank:false)
    }
    static belongsTo = [Fecha,Programa]
    static mapping = {
        version false
        id composite:['fecha','programa'], generator:'assigned'
    }
    def String toString() {
        return programa.getNombre()+" "+fecha.toString()
    }
}
