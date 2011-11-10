package modelo

class Usuario {
    String nombre
    String contrasena
    String perfil

    static constraints = {
        nombre(blank:false)
        contrasena(blank:false)
        perfil(blank:false)
    }
    static belongsTo = [Proyecto]
    static mapping = {
        version false
    }
    static hasMany = [usuarioProyecto:Proyecto]
    static mappedBy = [usuarioProyecto:'usuarioProyecto']
    def String toString() {
        return nombre
    }
}
