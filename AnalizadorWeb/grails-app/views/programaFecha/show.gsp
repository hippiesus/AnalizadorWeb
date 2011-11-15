
<%@ page import="modelo.ProgramaFecha" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'programaFecha.label', default: 'ProgramaFecha')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="programaFecha.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: programaFechaInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="programaFecha.cantidadDefectosBajo.label" default="Cantidad Defectos Bajo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: programaFechaInstance, field: "cantidadDefectosBajo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="programaFecha.cantidadDefectosMedio.label" default="Cantidad Defectos Medio" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: programaFechaInstance, field: "cantidadDefectosMedio")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="programaFecha.cantidadDefectosCritico.label" default="Cantidad Defectos Critico" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: programaFechaInstance, field: "cantidadDefectosCritico")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="programaFecha.fecha.label" default="Fecha" /></td>
                            
                            <td valign="top" class="value"><g:link controller="fecha" action="show" id="${programaFechaInstance?.fecha?.id}">${programaFechaInstance?.fecha?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="programaFecha.programa.label" default="Programa" /></td>
                            
                            <td valign="top" class="value"><g:link controller="programa" action="show" id="${programaFechaInstance?.programa?.id}">${programaFechaInstance?.programa?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${programaFechaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
