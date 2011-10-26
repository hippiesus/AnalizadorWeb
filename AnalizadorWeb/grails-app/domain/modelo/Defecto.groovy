package modelo

class Defecto {
    String nombre
    String descripcion
    String clasificacion

    static constraints = {
    }
    static hasMany = [programas:Programa]
    static mappedBy = [programaDefecto:'programaDefecto']
    static mapping = {
      version false
    }
    def String toString() {
        return nombre
    }
}
