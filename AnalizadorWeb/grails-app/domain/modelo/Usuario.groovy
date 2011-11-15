package modelo

class Usuario {
    String nombre
    String contrasena
    Perfil perfil

    static constraints = {
        nombre(blank:false)
        contrasena(blank:false)
<<<<<<< HEAD
        perfil(blank:false)
=======
>>>>>>> validacion
    }
    static belongsTo = [Proyecto,Perfil]
    static mapping = {
        version false
    }
    static hasMany = [usuarioProyecto:Proyecto]
    static mappedBy = [usuarioProyecto:'usuarioProyecto']
    def String toString() {
        return nombre
    }
}
