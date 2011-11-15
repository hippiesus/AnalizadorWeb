package modelo

class Perfil {
    String nombre
    String descripcion

    static hasMany = [usuarios:Usuario]

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
