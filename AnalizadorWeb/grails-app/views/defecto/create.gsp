

<%@ page import="modelo.Defecto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'defecto.label', default: 'Defecto')}" />
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
            <g:hasErrors bean="${defectoInstance}">
            <div class="errors">
                <g:renderErrors bean="${defectoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombre"><g:message code="defecto.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: defectoInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${defectoInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descripcion"><g:message code="defecto.descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: defectoInstance, field: 'descripcion', 'errors')}">
                                    <g:textField name="descripcion" value="${defectoInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
<<<<<<< HEAD
<<<<<<< HEAD
                                    <label for="clasificacion"><g:message code="defecto.clasificacion.label" default="Clasificacion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: defectoInstance, field: 'clasificacion', 'errors')}">
                                    <g:textField name="clasificacion" value="${defectoInstance?.clasificacion}" />
=======
                                    <label for="expresion"><g:message code="defecto.expresion.label" default="Expresion" /></label>
                                </td>
=======
                                    <label for="expresion"><g:message code="defecto.expresion.label" default="Expresion" /></label>
                                </td>
>>>>>>> validacion
                                <td valign="top" class="value ${hasErrors(bean: defectoInstance, field: 'expresion', 'errors')}">
                                    <g:textField name="expresion" value="${defectoInstance?.expresion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="coreccion"><g:message code="defecto.coreccion.label" default="Coreccion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: defectoInstance, field: 'coreccion', 'errors')}">
                                    <g:textField name="coreccion" value="${defectoInstance?.coreccion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="clasificacion"><g:message code="defecto.clasificacion.label" default="Clasificacion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: defectoInstance, field: 'clasificacion', 'errors')}">
                                    <g:select name="clasificacion.id" from="${modelo.Clasificacion.list()}" optionKey="id" value="${defectoInstance?.clasificacion?.id}"  />
<<<<<<< HEAD
>>>>>>> validacion
=======
>>>>>>> validacion
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
