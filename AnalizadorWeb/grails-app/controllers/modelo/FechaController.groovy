package modelo

class FechaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [fechaInstanceList: Fecha.list(params), fechaInstanceTotal: Fecha.count()]
    }

    def create = {
        def fechaInstance = new Fecha()
        fechaInstance.properties = params
        return [fechaInstance: fechaInstance]
    }

    def save = {
        def fechaInstance = new Fecha(params)
        if (fechaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'fecha.label', default: 'Fecha'), fechaInstance.id])}"
            redirect(action: "show", id: fechaInstance.id)
        }
        else {
            render(view: "create", model: [fechaInstance: fechaInstance])
        }
    }

    def show = {
        def fechaInstance = Fecha.get(params.id)
        if (!fechaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fecha.label', default: 'Fecha'), params.id])}"
            redirect(action: "list")
        }
        else {
            [fechaInstance: fechaInstance]
        }
    }

    def edit = {
        def fechaInstance = Fecha.get(params.id)
        if (!fechaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fecha.label', default: 'Fecha'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [fechaInstance: fechaInstance]
        }
    }

    def update = {
        def fechaInstance = Fecha.get(params.id)
        if (fechaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (fechaInstance.version > version) {
                    
                    fechaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'fecha.label', default: 'Fecha')] as Object[], "Another user has updated this Fecha while you were editing")
                    render(view: "edit", model: [fechaInstance: fechaInstance])
                    return
                }
            }
            fechaInstance.properties = params
            if (!fechaInstance.hasErrors() && fechaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'fecha.label', default: 'Fecha'), fechaInstance.id])}"
                redirect(action: "show", id: fechaInstance.id)
            }
            else {
                render(view: "edit", model: [fechaInstance: fechaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fecha.label', default: 'Fecha'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def fechaInstance = Fecha.get(params.id)
        if (fechaInstance) {
            try {
                fechaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'fecha.label', default: 'Fecha'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'fecha.label', default: 'Fecha'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fecha.label', default: 'Fecha'), params.id])}"
            redirect(action: "list")
        }
    }
}
