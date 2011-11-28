
<%@ page import="modelo.*" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'programa.label', default: 'Programa')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <div class="nav">
    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
  </div>
  <div class="body">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
      <table>
        <tbody>

          <tr class="prop">
            <td valign="top" class="name"><g:message code="programa.id.label" default="Id" /></td>

        <td valign="top" class="value">${fieldValue(bean: programaInstance, field: "id")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="programa.nombre.label" default="Nombre" /></td>

        <td valign="top" class="value">${fieldValue(bean: programaInstance, field: "nombre")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="programa.descripcion.label" default="Descripcion" /></td>

        <td valign="top" class="value">${fieldValue(bean: programaInstance, field: "descripcion")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="programa.codigo.label" default="Codigo" /></td>
<% def codigo=""
   def agregado=""
   def nueva=""

String[] lineas = programaInstance.getCodigo().split("<br>")
for(int y=1; y<lineas.length;y++){
    def bandera=false
  for(int x=0; x<DefectoProgramas.list().size();x++){
      
    if(y==DefectoProgramas.list().get(x).numeroLinea){
      bandera=true
     // nueva=nueva+y
      agregado="<span style='color: red;'>"+lineas[y-1]+"</span><br>"
      nueva=nueva+agregado
    }/*else{
      agregado=lineas[y-1]+"<br>"
    //  nueva=nueva+agregado
    }*/
    
  }
  if(bandera==false){
    agregado=lineas[y-1]+"<br>"
    nueva=nueva+agregado
  }
  codigo=codigo+agregado
}
%>
        <td valign="top" class="value">${codigo}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="programa.defectos.label" default="Defectos" /></td>

        <td valign="top" style="text-align: left;" class="value">
          <ul>
            <g:each in="${programaInstance.defectos}" var="d">
              <li><g:link controller="defecto" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="programa.programaFecha.label" default="Programa Fecha" /></td>

        <td valign="top" style="text-align: left;" class="value">
          <ul>
            <g:each in="${programaInstance.programaFecha}" var="p">
              <li><g:link controller="programaFecha" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="programa.proyecto.label" default="Proyecto" /></td>

        <td valign="top" class="value"><g:link controller="proyecto" action="show" id="${programaInstance?.proyecto?.id}">${programaInstance?.proyecto?.encodeAsHTML()}</g:link></td>

        </tr>

        </tbody>
      </table>
    </div>
    <div class="buttons">
      <g:form>
        <g:hiddenField name="id" value="${programaInstance?.id}" />
        <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
        <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
      </g:form>
    </div>
  </div>
<%//programaInstance.getCodigo().each({print it.replace("\n","<br>")})%>
</body>
</html>
