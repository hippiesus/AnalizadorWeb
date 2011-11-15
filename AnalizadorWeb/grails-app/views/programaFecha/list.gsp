
<%@ page import="modelo.ProgramaFecha" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'programaFecha.label', default: 'ProgramaFecha')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'programaFecha.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="cantidadDefectosBajo" title="${message(code: 'programaFecha.cantidadDefectosBajo.label', default: 'Cantidad Defectos Bajo')}" />
                        
                            <g:sortableColumn property="cantidadDefectosMedio" title="${message(code: 'programaFecha.cantidadDefectosMedio.label', default: 'Cantidad Defectos Medio')}" />
                        
                            <g:sortableColumn property="cantidadDefectosCritico" title="${message(code: 'programaFecha.cantidadDefectosCritico.label', default: 'Cantidad Defectos Critico')}" />
                        
                            <th><g:message code="programaFecha.fecha.label" default="Fecha" /></th>
                        
                            <th><g:message code="programaFecha.programa.label" default="Programa" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${programaFechaInstanceList}" status="i" var="programaFechaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${programaFechaInstance.id}">${fieldValue(bean: programaFechaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: programaFechaInstance, field: "cantidadDefectosBajo")}</td>
                        
                            <td>${fieldValue(bean: programaFechaInstance, field: "cantidadDefectosMedio")}</td>
                        
                            <td>${fieldValue(bean: programaFechaInstance, field: "cantidadDefectosCritico")}</td>
                        
                            <td>${fieldValue(bean: programaFechaInstance, field: "fecha")}</td>
                        
                            <td>${fieldValue(bean: programaFechaInstance, field: "programa")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${programaFechaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
