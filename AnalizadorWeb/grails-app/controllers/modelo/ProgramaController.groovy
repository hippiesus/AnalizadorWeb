package modelo

class ProgramaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [programaInstanceList: Programa.list(params), programaInstanceTotal: Programa.count()]
    }

    def create = {
        def programaInstance = new Programa()
        programaInstance.properties = params
        return [programaInstance: programaInstance]
    }

    def save = {
        try{
            def f = request.getFile('codigo')
            def file
            if(!f.empty) {
                try{
                    file = new File(f.fileItem.fileName)
                    f.transferTo(file)
                }catch(Exception e){
                }
                //redirect(action: "list", params: params)        
            }else{
                flash.message = "Debe seleccionar el archivo"
                redirect(action: "create")
            }
            def programaInstance = new Programa(nombre:f.fileItem.fileName,descripcion:params.descripcion,codigo:file.getText().replace("\n","<br>"),proyecto:Proyecto.get(params.proyecto.id))
            if (programaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.created.message', args: [message(code: 'programa.label', default: 'Programa'), programaInstance.id])}"
                redirect(action: "show", id: programaInstance.id)
            }
            else {
                render(view: "create", model: [programaInstance: programaInstance])
            }
        }catch(Exception e){
            flash.message = "Error al procesar el archivo seleccionado"
            redirect(action: "create")
        }
    }

    def show = {
        def programaInstance = Programa.get(params.id)
        // programaInstance.getCodigo().each({print it})
        if (!programaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'programa.label', default: 'Programa'), params.id])}"
            redirect(action: "list")
        }
        else {
            [programaInstance: programaInstance]
        }
    }

    def edit = {
        def programaInstance = Programa.get(params.id)
        if (!programaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'programa.label', default: 'Programa'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [programaInstance: programaInstance]
        }
    }

    def update = {
        def programaInstance = Programa.get(params.id)
        if (programaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (programaInstance.version > version) {
                    
                    programaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'programa.label', default: 'Programa')] as Object[], "Another user has updated this Programa while you were editing")
                    render(view: "edit", model: [programaInstance: programaInstance])
                    return
                }
            }
            programaInstance.properties = params
            if (!programaInstance.hasErrors() && programaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'programa.label', default: 'Programa'), programaInstance.id])}"
                redirect(action: "show", id: programaInstance.id)
            }
            else {
                render(view: "edit", model: [programaInstance: programaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'programa.label', default: 'Programa'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def programaInstance = Programa.get(params.id)
        if (programaInstance) {
            try {
                programaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'programa.label', default: 'Programa'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'programa.label', default: 'Programa'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'programa.label', default: 'Programa'), params.id])}"
            redirect(action: "list")
        }
    }
}
