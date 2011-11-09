package modelo

class DefectoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [defectoInstanceList: Defecto.list(params), defectoInstanceTotal: Defecto.count()]
    }

    def create = {
        def defectoInstance = new Defecto()
        defectoInstance.properties = params
        return [defectoInstance: defectoInstance]
    }

    def save = {
        def defectoInstance = new Defecto(params)
        if (defectoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'defecto.label', default: 'Defecto'), defectoInstance.id])}"
            redirect(action: "show", id: defectoInstance.id)
        }
        else {
            render(view: "create", model: [defectoInstance: defectoInstance])
        }
    }

    def show = {
        def defectoInstance = Defecto.get(params.id)
        if (!defectoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'defecto.label', default: 'Defecto'), params.id])}"
            redirect(action: "list")
        }
        else {
            [defectoInstance: defectoInstance]
        }
    }

    def edit = {
        def defectoInstance = Defecto.get(params.id)
        if (!defectoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'defecto.label', default: 'Defecto'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [defectoInstance: defectoInstance]
        }
    }

    def update = {
        def defectoInstance = Defecto.get(params.id)
        if (defectoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (defectoInstance.version > version) {
                    
                    defectoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'defecto.label', default: 'Defecto')] as Object[], "Another user has updated this Defecto while you were editing")
                    render(view: "edit", model: [defectoInstance: defectoInstance])
                    return
                }
            }
            defectoInstance.properties = params
            if (!defectoInstance.hasErrors() && defectoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'defecto.label', default: 'Defecto'), defectoInstance.id])}"
                redirect(action: "show", id: defectoInstance.id)
            }
            else {
                render(view: "edit", model: [defectoInstance: defectoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'defecto.label', default: 'Defecto'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def defectoInstance = Defecto.get(params.id)
        if (defectoInstance) {
            try {
                defectoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'defecto.label', default: 'Defecto'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'defecto.label', default: 'Defecto'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'defecto.label', default: 'Defecto'), params.id])}"
            redirect(action: "list")
        }
    }
}
