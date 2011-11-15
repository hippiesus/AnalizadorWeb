class LoginTagLib {
    def loginControl = {
        if(session.usuario){
            out << "<p><h1>Hola '${session.usuario}'</h1></p>  "
            out << """<p>[<a href="../usuario/edit/${session.usuario.id}">Perfil</a>] [${link(action:"logout", controller:"login"){"Salir"}}]</p>"""

        } else {
            out << "<p><h1>Bienvenido invitado</p></h1>"
            out << "<p>si tienes una cuenta,</p> por favor "
            out << """[${link(action:"login", controller:"login"){"Ingresa"}}]"""
            out << " al sistema."
        }

    }
}

