package modelo

class Fecha {
    Date fecha
    static constraints = {
    }
    static hasMany = [programaFecha:ProgramaFecha]
}
