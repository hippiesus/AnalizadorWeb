package modelo

import java.text.*
import org.codehaus.groovy.grails.commons.ConfigurationHolder

class ProgramaFechaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }
    def exportService
    /*    int cantidadDefectosBajo
    int cantidadDefectosMedio
    int cantidadDefectosCritico
    Fecha fecha
    Programa programa*/
    def list = {
        if(!params.max) params.max = 10

        if(params?.format && params.format != "html"){
            response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=asistencia.${params.extension}")


            List fields = ["cantidadDefectosBajo", "cantidadDefectosMedio","cantidadDefectosCritico","fecha","programa"]
            Map labels = ["cantidadDefectosBajo": "cantidadDefectosBajo", "Cantidad Defectos Medio": "cantidadDefectosMedio","Cantidad Defectos Critico":"Cantidad Defectos Critico","fecha":"Fecha","programa":"Programa"]

            // Formatter closure
            def upperCase = { domain, value ->
                return value.toUpperCase()
            }

            Map formatters = [usuario: upperCase]
            //Map parameters = [nombre: "", "column.widths": [0.2, 0.3, 0.5]]
            Map parameters = ["pdf.encoding":"UniGB-UCS2-H", "font.family": "STSong-Light"]

            exportService.export(params.format, response.outputStream, ProgramaFecha.list(params), fields, labels, formatters, parameters)
        }

        [ programaFechaInstanceList: ProgramaFecha.list( params ), programaFechaInstanceTotal: ProgramaFecha.count()]

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
        try{
            def f = request.getFile('estadistica')
            if(!f.empty) {
                f.transferTo( new File('estadistica.xml') )
                def estadisticas = new XmlSlurper().parse(new File("estadistica.xml"))
                estadisticas.estadistica.each({
                        def defecto=[]
                        def contdef=[]
                        for(int x=0; x< Programa.list().size();x++ ){
                            for(int y=0; y<Defecto.list().size();y++){
                                if(it."${Defecto.list().get(y).getNombre()}".text().length()>2){ // reviso que los valores sean mas que los []
                                    defecto.add(Defecto.list().get(y))
                                    contdef.add(y)
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
                                def programa = Programa.get(x+1)
                                println programa
                                for(int d=0; d < defecto.size();d++){
                                    def lineas
                                    lineas=it."${defecto[d]}".text().replace("[","")
                                    lineas=lineas.replace("]","")
                                    lineas=lineas.replace(" ","")
                                    String[] linea= lineas.split(",")
                                    for(int l=0; l<linea.size();l++){
                                        def dp=new DefectoProgramas(numeroLinea:linea[l],defecto:defecto[d],programa:programa).save(failOnError:true)
                                        programa.addToDefectos(dp)
                                    }
                                    try{
                                        programa.refresh()
                                    }catch(Exception e){
                                        programa.save(failOnError:true)                                    
                                    }
                                }
                        
                            
                                new ProgramaFecha(Programa:Programa.list().get(x),cantidadDefectosCritico:cantidadDefectoCritico,cantidadDefectosMedio:cantidadDefectoMedio,cantidadDefectosBajo:cantidadDefectoBajo,fecha:fecha).save(failOnError: true)
                                /*}catch(Exception e){
                                flash.message= e.getMessage()
                            
                                }*/
                            
                            }
                        }
                    })
                redirect(action: "list", params: params)
                //response.sendError(200,'Done');
            }else{
                flash.message = "Debe seleccionar el archivo"
                redirect(action: "create")
            } 
        }catch(Exception e){
            flash.message = "Error al procesar el archivo seleccionado"
            redirect(action: "create")
        }
     
    }
}
