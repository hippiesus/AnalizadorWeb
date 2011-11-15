

<%@ page import="modelo.Proyecto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'proyecto.label', default: 'Proyecto')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${proyectoInstance}">
            <div class="errors">
                <g:renderErrors bean="${proyectoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${proyectoInstance?.id}" />
                <g:hiddenField name="version" value="${proyectoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="proyecto.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: proyectoInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${proyectoInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descripcion"><g:message code="proyecto.descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: proyectoInstance, field: 'descripcion', 'errors')}">
                                    <g:textField name="descripcion" value="${proyectoInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="programas"><g:message code="proyecto.programas.label" default="Programas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: proyectoInstance, field: 'programas', 'errors')}">
                                    
<ul>
<g:each in="${proyectoInstance?.programas?}" var="p">
    <li><g:link controller="programa" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="programa" action="create" params="['proyecto.id': proyectoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'programa.label', default: 'Programa')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="usuarioProyecto"><g:message code="proyecto.usuarioProyecto.label" default="Usuario Proyecto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: proyectoInstance, field: 'usuarioProyecto', 'errors')}">
                                    <g:select name="usuarioProyecto" from="${modelo.Usuario.list()}" multiple="yes" optionKey="id" size="5" value="${proyectoInstance?.usuarioProyecto*.id}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
