package modelo

class ProgramaFechaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [programaFechaInstanceList: ProgramaFecha.list(params), programaFechaInstanceTotal: ProgramaFecha.count()]
    }

    def create = {
        def programaFechaInstance = new ProgramaFecha()
        programaFechaInstance.properties = params
        return [programaFechaInstance: programaFechaInstance]
    }

    def save = {
        def programaFechaInstance = new ProgramaFecha(params)
        if (programaFechaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'programaFecha.label', default: 'ProgramaFecha'), programaFechaInstance.id])}"
            redirect(action: "show", id: programaFechaInstance.id)
        }
        else {
            render(view: "create", model: [programaFechaInstance: programaFechaInstance])
        }
    }

    def show = {
        def programaFechaInstance = ProgramaFecha.get(params.id)
        if (!programaFechaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'programaFecha.label', default: 'ProgramaFecha'), params.id])}"
            redirect(action: "list")
        }
        else {
            [programaFechaInstance: programaFechaInstance]
        }
    }

    def edit = {
        def programaFechaInstance = ProgramaFecha.get(params.id)
        if (!programaFechaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'programaFecha.label', default: 'ProgramaFecha'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [programaFechaInstance: programaFechaInstance]
        }
    }

    def update = {
        def programaFechaInstance = ProgramaFecha.get(params.id)
        if (programaFechaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (programaFechaInstance.version > version) {
                    
                    programaFechaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'programaFecha.label', default: 'ProgramaFecha')] as Object[], "Another user has updated this ProgramaFecha while you were editing")
                    render(view: "edit", model: [programaFechaInstance: programaFechaInstance])
                    return
                }
            }
            programaFechaInstance.properties = params
            if (!programaFechaInstance.hasErrors() && programaFechaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'programaFecha.label', default: 'ProgramaFecha'), programaFechaInstance.id])}"
                redirect(action: "show", id: programaFechaInstance.id)
            }
            else {
                render(view: "edit", model: [programaFechaInstance: programaFechaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'programaFecha.label', default: 'ProgramaFecha'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def programaFechaInstance = ProgramaFecha.get(params.id)
        if (programaFechaInstance) {
            try {
                programaFechaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'programaFecha.label', default: 'ProgramaFecha'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'programaFecha.label', default: 'ProgramaFecha'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'programaFecha.label', default: 'ProgramaFecha'), params.id])}"
            redirect(action: "list")
        }
    }
}
