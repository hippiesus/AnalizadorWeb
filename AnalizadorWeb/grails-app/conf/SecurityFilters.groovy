
class SecurityFilters {
    def filters = {
        GestionEventosFilter(controller:'*', action:'*') {
            
            before = {
                if(!session.usuario && !controllerName.equals('login')) {
                    if(controllerName.equals("usuario")){
                        if(actionName.equals("create")){
                            
                        }else{
                            redirect(controller:"login", action:"login")
                            return false
                        }
                        
                    }else{
                        redirect(controller:"login", action:"login")
                        return false
                    }
                }else if(session.usuario && session.usuario.perfil.equals("usuario") && controllerName.equals("defecto") && controllerName.equals("perfil") ){
                    redirect(controller:"proyecto", action:"list")
                    return false
                    
                }   
            }
        }
    }
}


