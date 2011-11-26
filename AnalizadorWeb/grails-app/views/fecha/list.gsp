
<%@ page import="modelo.Fecha" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'fecha.label', default: 'Fecha')}" />
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
                        
                            <!--g:sortableColumn property="id" title="${message(code: 'fecha.id.label', default: 'Id')}" /-->
                        
                            <g:sortableColumn property="fecha" title="${message(code: 'fecha.fecha.label', default: 'Fecha')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${fechaInstanceList}" status="i" var="fechaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${fechaInstance.id}">${fieldValue(bean: fechaInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${fechaInstance.fecha}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${fechaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
