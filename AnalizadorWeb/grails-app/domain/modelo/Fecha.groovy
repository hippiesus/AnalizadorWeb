package modelo

class Fecha {
    Date fecha
    static constraints = {
    }
    static hasMany = [programaFecha:ProgramaFecha]
    static mapping = {
        version false
    }
    def String toString() {
        return fecha
    }
}
