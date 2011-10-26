package modelo

class Usuario {
    String nombre
    String contraseña
    String perfil

    static constraints = {
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
