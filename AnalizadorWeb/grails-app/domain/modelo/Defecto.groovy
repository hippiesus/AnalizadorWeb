package modelo

class Defecto {
    String nombre
    String descripcion
    String expresion
    String coreccion
    Clasificacion clasificacion
    
    static constraints = {
        nombre(unique:true)
    }
    static belongsTo = [Clasificacion]
    static hasMany = [programas:Programa]
    static mappedBy = [programaDefecto:'programaDefecto']
    static mapping = {
        version false
    }
    def String toString() {
        return nombre
    }
}
