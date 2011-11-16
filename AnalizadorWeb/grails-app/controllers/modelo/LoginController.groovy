package modelo

class LoginController {
    def index = { redirect(action:login,params:params) }

    def login = {}

    def manejaLogin = {
        def usuario = Usuario.findByNombreAndContrasena(params.nombre, params.contrasena)

        if (usuario) {
            if (usuario.perfil.nombre.equals("administrador")) {
                session.usuario = usuario
                redirect(controller:'proyecto')
            }
            else if (usuario.perfil.nombre.equals("usuario")){
                session.usuario= usuario
                redirect(controller:'proyecto')

            }
        }
        else{
            flash.message = "Usuario no encontrado: ${params.nombre}"
            redirect(action:'login')
            return
        }
    }
    def logout = {
        if(session.usuario) {
            session.usuario = null
            redirect(action:'login')
        }
    }

}
