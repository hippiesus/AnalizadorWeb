package modelo

class ProgramaFecha {
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
    }
    def String toString() {
        return programa+fecha
    }
}
