package modelo

class Programa {
    String nombre
    String descripcion
    String codigo
    Proyecto proyecto
    
    static constraints = {
    }
    static belongsTo = [Proyecto,Defecto]
    static hasMany = [programaFecha:ProgramaFecha,defectos:Defecto]
    static mappedBy = [programaDefecto:'prgramaDefecto']
    static mapping = {
      version false
    }
    def String toString() {
        return nombre
    }
}
