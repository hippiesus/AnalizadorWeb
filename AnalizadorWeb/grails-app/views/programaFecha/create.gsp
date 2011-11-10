

<%@ page import="modelo.ProgramaFecha" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'programaFecha.label', default: 'ProgramaFecha')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${programaFechaInstance}">
            <div class="errors">
                <g:renderErrors bean="${programaFechaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cantidadDefectosBajo"><g:message code="programaFecha.cantidadDefectosBajo.label" default="Cantidad Defectos Bajo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: programaFechaInstance, field: 'cantidadDefectosBajo', 'errors')}">
                                    <g:textField name="cantidadDefectosBajo" value="${fieldValue(bean: programaFechaInstance, field: 'cantidadDefectosBajo')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cantidadDefectosMedio"><g:message code="programaFecha.cantidadDefectosMedio.label" default="Cantidad Defectos Medio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: programaFechaInstance, field: 'cantidadDefectosMedio', 'errors')}">
                                    <g:textField name="cantidadDefectosMedio" value="${fieldValue(bean: programaFechaInstance, field: 'cantidadDefectosMedio')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cantidadDefectosCritico"><g:message code="programaFecha.cantidadDefectosCritico.label" default="Cantidad Defectos Critico" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: programaFechaInstance, field: 'cantidadDefectosCritico', 'errors')}">
                                    <g:textField name="cantidadDefectosCritico" value="${fieldValue(bean: programaFechaInstance, field: 'cantidadDefectosCritico')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fecha"><g:message code="programaFecha.fecha.label" default="Fecha" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: programaFechaInstance, field: 'fecha', 'errors')}">
                                    <g:select name="fecha.id" from="${modelo.Fecha.list()}" optionKey="id" value="${programaFechaInstance?.fecha?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="programa"><g:message code="programaFecha.programa.label" default="Programa" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: programaFechaInstance, field: 'programa', 'errors')}">
                                    <g:select name="programa.id" from="${modelo.Programa.list()}" optionKey="id" value="${programaFechaInstance?.programa?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
