

<%@ page import="modelo.ProgramaFecha" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'programaFecha.label', default: 'ProgramaFecha')}" />
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
    <g:hasErrors bean="${programaFechaInstance}">
      <div class="errors">
        <g:renderErrors bean="${programaFechaInstance}" as="list" />
      </div>
    </g:hasErrors>
    <g:form action="upload" method="post" enctype="multipart/form-data">
      <input type="file" name="estadistica" />
      <input type="submit" />
    </g:form>
  </div>
</body>
</html>
