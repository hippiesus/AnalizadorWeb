package modelo

class Clasificacion {
    String nombre
    String descripcion
    static hasMany = [defectos:Defecto]

    static constraints = {
        nombre(blank:false)
        descripcion(blank:false)
    }
    static mapping = {
        version false
    }
    def String toString() {
        return nombre
    }
}
