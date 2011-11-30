
<%@ page import="modelo.Programa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'programa.label', default: 'Programa')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'programa.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'programa.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'programa.descripcion.label', default: 'Descripcion')}" />
                        
                            
                        
                            <th><g:message code="programa.proyecto.label" default="Proyecto" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${programaInstanceList}" status="i" var="programaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${programaInstance.id}">${fieldValue(bean: programaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: programaInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: programaInstance, field: "descripcion")}</td>
                        

                        
                            <td>${fieldValue(bean: programaInstance, field: "proyecto")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${programaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
