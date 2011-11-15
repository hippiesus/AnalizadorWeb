
<%@ page import="modelo.Proyecto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'proyecto.label', default: 'Proyecto')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'proyecto.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'proyecto.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'proyecto.descripcion.label', default: 'Descripcion')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${proyectoInstanceList}" status="i" var="proyectoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${proyectoInstance.id}">${fieldValue(bean: proyectoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: proyectoInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: proyectoInstance, field: "descripcion")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${proyectoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
