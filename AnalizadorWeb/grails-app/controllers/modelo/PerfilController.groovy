package modelo

class PerfilController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [perfilInstanceList: Perfil.list(params), perfilInstanceTotal: Perfil.count()]
    }

    def create = {
        def perfilInstance = new Perfil()
        perfilInstance.properties = params
        return [perfilInstance: perfilInstance]
    }

    def save = {
        def perfilInstance = new Perfil(params)
        if (perfilInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'perfil.label', default: 'Perfil'), perfilInstance.id])}"
            redirect(action: "show", id: perfilInstance.id)
        }
        else {
            render(view: "create", model: [perfilInstance: perfilInstance])
        }
    }

    def show = {
        def perfilInstance = Perfil.get(params.id)
        if (!perfilInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'perfil.label', default: 'Perfil'), params.id])}"
            redirect(action: "list")
        }
        else {
            [perfilInstance: perfilInstance]
        }
    }

    def edit = {
        def perfilInstance = Perfil.get(params.id)
        if (!perfilInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'perfil.label', default: 'Perfil'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [perfilInstance: perfilInstance]
        }
    }

    def update = {
        def perfilInstance = Perfil.get(params.id)
        if (perfilInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (perfilInstance.version > version) {
                    
                    perfilInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'perfil.label', default: 'Perfil')] as Object[], "Another user has updated this Perfil while you were editing")
                    render(view: "edit", model: [perfilInstance: perfilInstance])
                    return
                }
            }
            perfilInstance.properties = params
            if (!perfilInstance.hasErrors() && perfilInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'perfil.label', default: 'Perfil'), perfilInstance.id])}"
                redirect(action: "show", id: perfilInstance.id)
            }
            else {
                render(view: "edit", model: [perfilInstance: perfilInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'perfil.label', default: 'Perfil'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def perfilInstance = Perfil.get(params.id)
        if (perfilInstance) {
            try {
                perfilInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'perfil.label', default: 'Perfil'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'perfil.label', default: 'Perfil'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'perfil.label', default: 'Perfil'), params.id])}"
            redirect(action: "list")
        }
    }
}
