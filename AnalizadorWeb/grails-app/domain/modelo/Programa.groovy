package modelo

class Programa {
    String nombre
    String descripcion
    String codigo
    Proyecto proyecto
    
    static constraints = {
        nombre(blank:false)
        descripcion(blank:false)
        codigo(blank:false,maxSize:9999)
    }
    static belongsTo = [Proyecto]
    static hasMany = [programaFecha:ProgramaFecha,defectos:DefectoProgramas]
   // static mappedBy = [programaDefecto:'prgramaDefecto']
    static mapping = {
        version false
    }
    def String toString() {
        return nombre
    }
}
