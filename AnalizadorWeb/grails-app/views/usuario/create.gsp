

<%@ page import="modelo.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${usuarioInstance}">
            <div class="errors">
                <g:renderErrors bean="${usuarioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombre"><g:message code="usuario.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${usuarioInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contrasena"><g:message code="usuario.contrasena.label" default="Contrasena" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'contrasena', 'errors')}">
                                    <g:textField name="contrasena" value="${usuarioInstance?.contrasena}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="perfil"><g:message code="usuario.perfil.label" default="Perfil" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'perfil', 'errors')}">
                                    <g:select name="perfil.id" from="${modelo.Perfil.list()}" optionKey="id" value="${usuarioInstance?.perfil?.id}"  />
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
