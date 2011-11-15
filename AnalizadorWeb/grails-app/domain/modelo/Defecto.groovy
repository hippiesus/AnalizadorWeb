package modelo

class Defecto {
    String nombre
    String descripcion
    String expresion
    String coreccion
    Clasificacion clasificacion
    
    static constraints = {
        nombre(blank:false)
        descripcion(blank:false)
<<<<<<< HEAD
        clasificacion(blank:false)
=======
        expresion(blank:false)
        coreccion(blank:false)
>>>>>>> validacion
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
