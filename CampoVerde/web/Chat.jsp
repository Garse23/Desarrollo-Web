<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mensaje</title>

        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <% String nombreUsuario = (String) session.getAttribute("nombreUsuario");
   Integer rolUsuario = (Integer) session.getAttribute("rolUsuario");%>
        <header>
            <div class="container-fluid" style="background: #4caf50">
                <nav class="navbar navbar-brand">
                    <div class="row w-100">
                        <div class="col-3">
                            <a href="indexSession.jsp"><img src="imagenes/logo.png" alt="logo" class="logo" style="width:100px"></a>
                        </div>
                        <div class="col-6 offset-3 text-end">
                            <a href="login.jsp"><img src="imagenes/login.png" alt="Imagen 1"style="width:100px"></a>
                            <a href="registro.jsp"><img src="imagenes/registrate.png" alt="Imagen 1"style="width: 100px"></a>
                        </div>
                    </div>
                </nav>
            </div>
        </header>
        <br>
        <div class="container-fluid">
            <div class="row w-100">
                <div class="col-2">
                    <div class="card">
                        
                    </div>
                </div>
                <div class="col-10 text-end">
                    <div class="card">
                        
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
