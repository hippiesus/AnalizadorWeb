package modelo

class ProyectoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [proyectoInstanceList: Proyecto.list(params), proyectoInstanceTotal: Proyecto.count()]
    }

    def create = {
        def proyectoInstance = new Proyecto()
        proyectoInstance.properties = params
        return [proyectoInstance: proyectoInstance]
    }

    def save = {
        def proyectoInstance = new Proyecto(params)
        if (proyectoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'proyecto.label', default: 'Proyecto'), proyectoInstance.id])}"
            redirect(action: "show", id: proyectoInstance.id)
        }
        else {
            render(view: "create", model: [proyectoInstance: proyectoInstance])
        }
    }

    def show = {
        def proyectoInstance = Proyecto.get(params.id)
        if (!proyectoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'proyecto.label', default: 'Proyecto'), params.id])}"
            redirect(action: "list")
        }
        else {
            [proyectoInstance: proyectoInstance]
        }
    }

    def edit = {
        def proyectoInstance = Proyecto.get(params.id)
        if (!proyectoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'proyecto.label', default: 'Proyecto'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [proyectoInstance: proyectoInstance]
        }
    }

    def update = {
        def proyectoInstance = Proyecto.get(params.id)
        if (proyectoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (proyectoInstance.version > version) {
                    
                    proyectoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'proyecto.label', default: 'Proyecto')] as Object[], "Another user has updated this Proyecto while you were editing")
                    render(view: "edit", model: [proyectoInstance: proyectoInstance])
                    return
                }
            }
            proyectoInstance.properties = params
            if (!proyectoInstance.hasErrors() && proyectoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'proyecto.label', default: 'Proyecto'), proyectoInstance.id])}"
                redirect(action: "show", id: proyectoInstance.id)
            }
            else {
                render(view: "edit", model: [proyectoInstance: proyectoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'proyecto.label', default: 'Proyecto'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def proyectoInstance = Proyecto.get(params.id)
        if (proyectoInstance) {
            try {
                proyectoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'proyecto.label', default: 'Proyecto'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'proyecto.label', default: 'Proyecto'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'proyecto.label', default: 'Proyecto'), params.id])}"
            redirect(action: "list")
        }
    }
}
