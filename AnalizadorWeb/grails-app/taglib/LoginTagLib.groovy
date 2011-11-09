class LoginTagLib {
    def loginControl = {
        if(session.user){
            out << "Hello ${session.user} "
            out << """[${link(action:"logout", controller:"login"){"Logout"}}]"""
        } else {
            out << """[${link(action:"login", controller:"login"){"Login"}}]"""
        }
    }
}

