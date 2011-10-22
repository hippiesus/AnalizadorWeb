package modelo

class Defecto {
    String nombre
    String descripcion
    String clasificacion

    static constraints = {
    }
    static hasMany = [programas:Programa]
    static mappedBy = [programaDefecto:'programaDefecto']
}
