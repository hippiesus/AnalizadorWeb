package modelo

class ClasificacionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [clasificacionInstanceList: Clasificacion.list(params), clasificacionInstanceTotal: Clasificacion.count()]
    }

    def create = {
        def clasificacionInstance = new Clasificacion()
        clasificacionInstance.properties = params
        return [clasificacionInstance: clasificacionInstance]
    }

    def save = {
        def clasificacionInstance = new Clasificacion(params)
        if (clasificacionInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'clasificacion.label', default: 'Clasificacion'), clasificacionInstance.id])}"
            redirect(action: "show", id: clasificacionInstance.id)
        }
        else {
            render(view: "create", model: [clasificacionInstance: clasificacionInstance])
        }
    }

    def show = {
        def clasificacionInstance = Clasificacion.get(params.id)
        if (!clasificacionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clasificacion.label', default: 'Clasificacion'), params.id])}"
            redirect(action: "list")
        }
        else {
            [clasificacionInstance: clasificacionInstance]
        }
    }

    def edit = {
        def clasificacionInstance = Clasificacion.get(params.id)
        if (!clasificacionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clasificacion.label', default: 'Clasificacion'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [clasificacionInstance: clasificacionInstance]
        }
    }

    def update = {
        def clasificacionInstance = Clasificacion.get(params.id)
        if (clasificacionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (clasificacionInstance.version > version) {
                    
                    clasificacionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'clasificacion.label', default: 'Clasificacion')] as Object[], "Another user has updated this Clasificacion while you were editing")
                    render(view: "edit", model: [clasificacionInstance: clasificacionInstance])
                    return
                }
            }
            clasificacionInstance.properties = params
            if (!clasificacionInstance.hasErrors() && clasificacionInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'clasificacion.label', default: 'Clasificacion'), clasificacionInstance.id])}"
                redirect(action: "show", id: clasificacionInstance.id)
            }
            else {
                render(view: "edit", model: [clasificacionInstance: clasificacionInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clasificacion.label', default: 'Clasificacion'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def clasificacionInstance = Clasificacion.get(params.id)
        if (clasificacionInstance) {
            try {
                clasificacionInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'clasificacion.label', default: 'Clasificacion'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'clasificacion.label', default: 'Clasificacion'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clasificacion.label', default: 'Clasificacion'), params.id])}"
            redirect(action: "list")
        }
    }
}
