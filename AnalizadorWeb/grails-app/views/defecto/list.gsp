
<%@ page import="modelo.Defecto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'defecto.label', default: 'Defecto')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'defecto.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'defecto.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'defecto.descripcion.label', default: 'Descripcion')}" />
                        
                            <g:sortableColumn property="clasificacion" title="${message(code: 'defecto.clasificacion.label', default: 'Clasificacion')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${defectoInstanceList}" status="i" var="defectoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${defectoInstance.id}">${fieldValue(bean: defectoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: defectoInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: defectoInstance, field: "descripcion")}</td>
                        
                            <td>${fieldValue(bean: defectoInstance, field: "clasificacion")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${defectoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
