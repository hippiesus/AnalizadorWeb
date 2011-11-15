<!DOCTYPE html>
<html>
  <head>
    <title><g:layoutTitle default="Grails" /></title>
  <div id="header">
    <div id="loginbox"><g:loginControl /></div>
  </div>

  <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
  <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
  <g:layoutHead />
  <g:javascript library="application" />
</head>
<body>
  <div id="spinner" class="spinner" style="display:none;">
    <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
  </div>
  <div id="grailsLogo"><a href="http://localhost:8080/AnalizadorWeb"><img src="${resource(dir:'images',file:'grails_logo.png')}" alt="Grails" border="0" /></a></div>
<%if(session.usuario && "administrador".equals(session.usuario.perfil.nombre)){%>
  <div class="nav" >
    <ul>
      <span class="menuButton"><a class="home" href="${createLink(uri: '/proyecto/list')}"><g:message code="default.home.label"/></a></span> |
      <span class="menuButton"><a class="controller" href="${createLink(uri: '/defecto/index')}"><g:message code="Defectos"/></a></span> |
      <span class="menuButton"><a class="controller" href="${createLink(uri: '/perfil/index')}"><g:message code="Perfiles"/></a></span> |
      <span class="menuButton"><a class="controller" href="${createLink(uri: '/programa/index')}"><g:message code="Programas"/></a></span> |
      <span class="menuButton"><a class="controller" href="${createLink(uri: '/proyecto/index')}"><g:message code="Proyectos"/></a></span> |
      <span class="menuButton"><a class="controller" href="${createLink(uri: '/usuario/index')}"><g:message code="Usuarios"/></a></span> |
    </ul>
  </div>
<%}else if(session.usuario && "usuario".equals(session.usuario.perfil.nombre)){%>
   <div class="nav" >
    <ul>
      <span class="menuButton"><a class="home" href="${createLink(uri: '/proyecto/list')}"><g:message code="default.home.label"/></a></span> |
      <span class="menuButton"><a class="controller" href="${createLink(uri: '/programa/index')}"><g:message code="Programas"/></a></span> |
      <span class="menuButton"><a class="controller" href="${createLink(uri: '/proyecto/index')}"><g:message code="Proyectos"/></a></span> |
    </ul>
  </div>
<%}%>
<g:layoutBody />
</body>
</html>