package modelo

class Fecha implements Serializable{
    Date fecha
    static constraints = {
    }
    static hasMany = [programaFecha:ProgramaFecha]
    static mapping = {
        version false
        id composite:['fecha']
    }
    def String toString() {
        return fecha
    }
}
