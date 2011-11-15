
class SecurityFilters {
    def filters = {
        GestionEventosFilter(controller:'*', action:'*') {
            
            before = {
             /*   if(!session.usuario && !controllerName.equals('login')) {
                    redirect(controller:"login", action:"login")
                    return false
                }else if(session.usuario && session.usuario.perfil.equals("usuario") && controllerName.equals("defecto")){
                    redirect(controller:"proyecto", action:"list")
                    return false
                    
                }                 */
            }
        }
    }
}


