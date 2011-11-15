import modelo.*
class BootStrap {

    def init = { servletContext ->
        if (!Clasificacion.count()) {
            new Clasificacion(nombre: "Critico", descripcion: "Defecto Critico").save(failOnError: true)
            new Clasificacion(nombre: "Medio", descripcion: "Defecto Medio").save(failOnError: true)
            new Clasificacion(nombre: "Bajo", descripcion: "Defecto Bajo").save(failOnError: true)
            new Perfil(nombre: "administrador", descripcion: "Acceso Total").save(failOnError: true)
            new Perfil(nombre: "usuario", descripcion: "Acceso Restringido").save(failOnError: true)
        }
    }
    def destroy = {
    }
}
