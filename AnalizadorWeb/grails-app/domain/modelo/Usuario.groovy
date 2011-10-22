package modelo

class Usuario {
    String nombre
    String contraseña
    String perfil

    static constraints = {
    }
    static belongsTo = [Proyecto]
    static hasMany = [usuarioProyecto:Proyecto]
    static mappedBy = [usuarioProyecto:'usuarioProyecto']
}
