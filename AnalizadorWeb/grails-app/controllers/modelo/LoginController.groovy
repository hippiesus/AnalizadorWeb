package modelo

class LoginController {
    def index = { redirect(action:login,params:params) }

    def login = {}

    def manejaLogin = {
        def usuario = Usuario.findByNombreAndContrasena(params.nombre, params.contrasena)

        if (usuario) {
            if (usuario.perfil=="administrador") {
                session.nombre = administrador
                redirect(controller:'proyecto')
            }
            else if(usuario.perfil=="usuario"){
                session.nombre= usuario
                redirect(controller:'proyecto')

            }
        }
        else{
            flash.message = "Usuario no encontrado: ${params.usuario}"
            redirect(action:'login')
            return
        }
    }
    def logout = {
        if(session.user) {
            session.user = null
            redirect(action:'login')
        }
    }

}
