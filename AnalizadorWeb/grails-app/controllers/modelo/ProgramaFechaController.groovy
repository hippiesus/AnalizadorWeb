package modelo

import java.text.*

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
    def upload = {
        def f = request.getFile('estadistica')
        if(!f.empty) {
            f.transferTo( new File('estadistica.xml') )
            def estadisticas = new XmlSlurper().parse(new File("estadistica.xml"))
            estadisticas.estadistica.each({
                    def defecto
                    for(int x=0; x< Programa.list().size();x++ ){
                        for(int y=0; y<Defecto.list().size();y++){
                            for(int z=0; z<Defecto.list().size();z++){
                                println it."${Defecto.list().get(z).getNombre()}"
                                if(Defecto.list().get(y).getNombre().equals(it."${Defecto.list().get(z).getNombre()}")){
                                  //  println Defecto.list().get(y).getNombre()
                                    defecto = Defecto.list().get(y)
                                }
                            }
                        }
                        if(it.nombreArchivo.toString().contains(Programa.list().get(x).getNombre().toLowerCase())){
                            //try{
                            def cantidadDefectoBajo=it.cantidadDefectosBajo.toString()
                            def cantidadDefectoMedio=it.cantidadDefectosMedio.toString()
                            def cantidadDefectoCritico=it.cantidadDefectosCritico.toString()
                            def fechaXml =it.fecha.toString().substring(4)
                            DateFormat dfm = new SimpleDateFormat("MMM dd HH:mm:ss z yyyy");
                            dfm.setTimeZone(TimeZone.getTimeZone("Chile/EasterIsland"));
                            Date par = dfm.parse(fechaXml);
                            def fecha = new Fecha(fecha:par).save()
                        //    new Programa(codigo:Programa.list().get(x).getCodigo(),descripcion:Programa.list().get(x).getDescripcion(),nombre:Programa.list().get(x).getNombre(),proyecto:Programa.list().get(x).getProyecto(), Defecto:defecto).save(failOnError: true)
                            new ProgramaFecha(Programa:Programa.list().get(x),cantidadDefectosCritico:cantidadDefectoCritico,cantidadDefectosMedio:cantidadDefectoMedio,cantidadDefectosBajo:cantidadDefectoBajo,fecha:fecha).save(failOnError: true)
                            /*}catch(Exception e){
                            flash.message= e.getMessage()
                            
                            }*/
                            
                        }
                    }
                })
            redirect(action: "list", params: params)
            //response.sendError(200,'Done');
        }    
     
    }
}
