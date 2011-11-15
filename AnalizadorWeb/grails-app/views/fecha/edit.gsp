

<%@ page import="modelo.Fecha" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'fecha.label', default: 'Fecha')}" />
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
            <g:hasErrors bean="${fechaInstance}">
            <div class="errors">
                <g:renderErrors bean="${fechaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${fechaInstance?.id}" />
                <g:hiddenField name="version" value="${fechaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fecha"><g:message code="fecha.fecha.label" default="Fecha" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: fechaInstance, field: 'fecha', 'errors')}">
                                    <g:datePicker name="fecha" precision="day" value="${fechaInstance?.fecha}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="programaFecha"><g:message code="fecha.programaFecha.label" default="Programa Fecha" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: fechaInstance, field: 'programaFecha', 'errors')}">
                                    
<ul>
<g:each in="${fechaInstance?.programaFecha?}" var="p">
    <li><g:link controller="programaFecha" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="programaFecha" action="create" params="['fecha.id': fechaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'programaFecha.label', default: 'ProgramaFecha')])}</g:link>

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
