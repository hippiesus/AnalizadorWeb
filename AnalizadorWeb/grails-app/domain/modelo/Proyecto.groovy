package modelo

class Proyecto {
    String nombre
    String descripcion
    
    static constraints = {
    }
    static hasMany = [usuarioProyecto:Usuario,programas:Programa]
    static mappedBy = [usuarioProyecto:'usuarioProyecto']
}
