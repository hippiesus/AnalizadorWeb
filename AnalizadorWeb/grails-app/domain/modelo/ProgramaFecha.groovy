package modelo

class ProgramaFecha {
    int cantidadDefectosBajo
    int cantidadDefectosMedio
    int cantidadDefectosCritico
    Fecha fecha
    Programa programa
    static constraints = {
    }
    static belongsTo = [Fecha,Programa]
    static mapping = {
      version false
    }
    def String toString() {
        return programa+fecha
    }
}
