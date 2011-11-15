
<%@ page import="modelo.Clasificacion" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'clasificacion.label', default: 'Clasificacion')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'clasificacion.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'clasificacion.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'clasificacion.descripcion.label', default: 'Descripcion')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${clasificacionInstanceList}" status="i" var="clasificacionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${clasificacionInstance.id}">${fieldValue(bean: clasificacionInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: clasificacionInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: clasificacionInstance, field: "descripcion")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${clasificacionInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
