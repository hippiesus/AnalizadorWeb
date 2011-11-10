

<%@ page import="modelo.Programa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'programa.label', default: 'Programa')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${programaInstance}">
            <div class="errors">
                <g:renderErrors bean="${programaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${programaInstance?.id}" />
                <g:hiddenField name="version" value="${programaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="programa.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: programaInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${programaInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descripcion"><g:message code="programa.descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: programaInstance, field: 'descripcion', 'errors')}">
                                    <g:textField name="descripcion" value="${programaInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="codigo"><g:message code="programa.codigo.label" default="Codigo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: programaInstance, field: 'codigo', 'errors')}">
                                    <g:textField name="codigo" value="${programaInstance?.codigo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="defectos"><g:message code="programa.defectos.label" default="Defectos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: programaInstance, field: 'defectos', 'errors')}">
                                    
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="programaFecha"><g:message code="programa.programaFecha.label" default="Programa Fecha" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: programaInstance, field: 'programaFecha', 'errors')}">
                                    
<ul>
<g:each in="${programaInstance?.programaFecha?}" var="p">
    <li><g:link controller="programaFecha" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="programaFecha" action="create" params="['programa.id': programaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'programaFecha.label', default: 'ProgramaFecha')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="proyecto"><g:message code="programa.proyecto.label" default="Proyecto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: programaInstance, field: 'proyecto', 'errors')}">
                                    <g:select name="proyecto.id" from="${modelo.Proyecto.list()}" optionKey="id" value="${programaInstance?.proyecto?.id}"  />
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
