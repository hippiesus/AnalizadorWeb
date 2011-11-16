import modelo.*
class BootStrap {

    def init = { servletContext ->
        if (!Clasificacion.count()) {
            new Clasificacion(nombre: "Critico", descripcion: "Defecto Critico").save(failOnError: true)
            new Clasificacion(nombre: "Medio", descripcion: "Defecto Medio").save(failOnError: true)
            new Clasificacion(nombre: "Bajo", descripcion: "Defecto Bajo").save(failOnError: true)
           def admin= new Perfil(nombre: "administrador", descripcion: "Acceso Total")
           admin.save(failOnError: true)
            new Perfil(nombre: "usuario", descripcion: "Acceso Restringido").save(failOnError: true)
           new Usuario(nombre:"administrador",contrasena:"administrador",perfil:admin).save(failOnError: true)
        }
    }
    def destroy = {
    }
}
