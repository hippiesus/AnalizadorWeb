<html>
  <head>
    <title>Login Eigol</title>
    <meta name="layout" content="main" />
  </head>
  <body>
    <div class="body">
      <g:if test="${flash.message}">
        <div class="message">
${flash.message}
        </div>
      </g:if>
      <p>
        Bienvenido
      </p>
      <form action="manejaLogin" method="POST">
        <span class='nameClear'><label for="usuario">Usuario:</label>
        </span>
        <td valign="top" class="value $ {hasErrors(bean:userInstance,field:'usuario','errors')}">
          <input type="text" id="nombre" name="nombre" value=""/>
        </td>
        <span class='nameClear'><label for="pasword">Password:</label>
          <td valign="top" class="value $ {hasErrors(bean:userInstance,field:'contraseña','errors')}">
            <input type="password" id="contraseña" name="contraseña" value=""/>
          </td>
        </span>
        <div class="buttons">
          <span class="button"><input class="save" type="submit" value="Login"
                                      /></span>
        </div>
      </form>
    </div>
  </body>
</html>
