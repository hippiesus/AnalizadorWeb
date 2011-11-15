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
  <div id="grailsLogo"><a href="http://grails.org"><img src="${resource(dir:'images',file:'grails_logo.png')}" alt="Grails" border="0" /></a></div>
<%if(session.usuario){%>
  <div class="nav" >

    <ul>
      <span class="menuButton"><a class="home" href="${createLink(uri: '/proyecto/list')}"><g:message code="default.home.label"/></a></span> |
      <g:each var="c" in="${grailsApplication.domainClasses.sort { it.shortName} }">
        <td class="controller" ><g:link controller="${c.logicalPropertyName}">${c.shortName}</g:link> | </td>
      </g:each>
    </ul>
  </div>
<%}%>
<g:layoutBody />
</body>
</html>