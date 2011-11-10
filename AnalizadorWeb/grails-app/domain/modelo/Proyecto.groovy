package modelo

class Proyecto {
    String nombre
    String descripcion
    
    static constraints = {
        nombre(blank:false)
        descripcion(blank:false)
    }
    static hasMany = [usuarioProyecto:Usuario,programas:Programa]
    static mappedBy = [usuarioProyecto:'usuarioProyecto']
    static mapping = {
        version false
    }
    def String toString() {
        return nombre
    }
}
