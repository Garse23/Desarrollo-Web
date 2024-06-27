<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Iniciar Sesi�n</title>
        <link rel="stylesheet" href="css/styleslogin.css">
    </head>
    <body>
        <header>
            <div class="imagenesLogin">
                <img src="imagenes/logo.png" alt="logo" class="logo">
                <a href="login.jsp"><img src="imagenes/login.png" alt="Imagen 1"></a>
                <a href="registro.jsp"><img src="imagenes/registrate.png" alt="Imagen 1"></a>
                <img src="imagenes/carrito.png" alt="">
            </div>

            <div class="navbar">
                <a href="index.jsp">Inicio</a>
                <a href="#categorias">Categor�as</a>
                <a href="#sobre-nosotros">Sobre nosotros</a>
            </div>
        </header>
        <br>

        <div class="container">
            <h2>Iniciar Sesi�n</h2>
            <form action="procesarLogin" method="post">
                <label for="correo">Correo Electr�nico:</label>
                <input type="email" id="correo" name="correo" required><br>
                <label for="contrasena">Contrase�a:</label>
                <input type="password" id="contrasena" name="contrasena" required>
                <button type="submit">Iniciar Sesi�n</button>
            </form>
        </div>

    </body>
</html>

