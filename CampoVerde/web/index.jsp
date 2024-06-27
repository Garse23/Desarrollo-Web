<%@ page import="controladores.ProductoServlet" %>
<%@ page import="modelo.Producto" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CampoVerde</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
    </head>
    <% String nombreUsuario = (String) session.getAttribute("nombreUsuario");
   Integer rolUsuario = (Integer) session.getAttribute("rolUsuario");
    Integer IdUsuario = (Integer) session.getAttribute("idUsuario");%>
    <body>
        <header>
            <nav class="navbar navbar-dark">
                <div class="row w-100 align-items-center text-end">
                    <div class="col-3 text-start">
                        <a href="index.jsp"><img src="imagenes/logo.png" alt="logo" class="" style="width:100px"></a>
                    </div>
                    <%if (IdUsuario != null){ %>
                    <div class="col-2 offset-6">
                        <div class="dropdown">
                            <button class="btn btn-light" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="imagenes/person-fill.svg" alt="alt" style="width: 30px"/>
                            </button>
                            <ul class="dropdown-menu" style="right:0; left: auto">
                                <li><span class="dropdown-item-text">Usuario: <%=nombreUsuario%></span></li>
                                <li><a class="dropdown-item" href="Chat.jsp">Chat</a></li>
                                <li><a class="dropdown-item" href="Foros.jsp">Foro</a></li>
                                    <% if (rolUsuario != null) {
                                            switch(rolUsuario) {
                                                case 1:
                                    %>
                                <li><a class="dropdown-item" href="paginaEmpleado.jsp">Empleado</a></li>
                                    <%
                                                    break;
                                                case 2:
                                    %>
                                <li><a class="dropdown-item" href="Proveedor.jsp">Proveedor</a></li>
                                    <%
                                                    break;
                                                case 4:
                                    %>
                                <li><a class="dropdown-item" href="paginaEmpleado.jsp">Empleado</a></li>
                                <li><a class="dropdown-item" href="Proveedor.jsp">Proveedor</a></li>
                                    <%
                                    default:%>
                                <li><a class="dropdown-item text-bg-danger" href="CerrarSesion">Cerrar Sesión</a></li>
                                <%
                                        break;
                                }
                            }%>
                            </ul>
                        </div>
                    </div>
                    <%} else {
                    %>
                    <div class="col-6"></div>
                    <div class="col-2  text-end">
                        <a href="login.jsp"><img src="imagenes/login.png" alt="Imagen 1"style="width:100px"></a>
                        <a href="registro.jsp"><img src="imagenes/registrate.png" alt="Imagen 1"style="width: 100px"></a>
                    </div>
                    <% 
                                        } 
                    %>
                    <div class="col-1">
                        <a href="Carrito.jsp"><img src="imagenes/carrito.png" alt=""style="width: 100px"></a>
                    </div>
                </div>
            </nav>
            <div class="container-fluid">
                <div class="navbar navbar-brand" style="background-color: #4CAF50">
                    <div class="row w-100 text-center">
                        <div class ="col-4">
                            <a href="index.jsp" class="btn btn-outline-light">Inicio</a>
                        </div>
                        <div class ="col-4">
                            <a href="productos.jsp" class="btn btn-outline-light">Productos</a>
                        </div>
                        <div class ="col-4">
                            <a href="#sobre-nosotros" class="btn btn-outline-light">Sobre nosotros</a>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container-fluid"> 
            <img src="imagenes/anuncio.png" alt="" style="width:98.95%">
        </div>
        <br>
        <div class="container-fluid">
            <div class="row">
                <% 
                    ProductoServlet productoServlet = new ProductoServlet();
                    List<Producto> productos = null;
                    try {
                        productos = productoServlet.obtenerProductosHabilitados();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
            
                    if (productos != null) {
                        for (Producto producto : productos) {
                %>
                <div class="card col-3">
                    <form action="AgregarCarrito" method="post">
                    <div class="card-body">
                        <img src="imagenes/anuncio.png" alt="Producto" style="width: 100%">
                        <input type="hidden" id="idProducto" name="idProducto" value="<%=producto.getIdProducto()%>">
                        <input type="hidden" id="cantidad" name="cantidad" value="1">
                        <input type="hidden" id="origen" name="origen" value="index">
                        <h3><%= producto.getNomProducto()%></h3>
                        <p>Precio: $<%= producto.getPrecioProducto() %></p>
                        <button class="btn btn-success">Agregar al carrito</button>
                    </div>
                    </form>
                </div>
                <% 
                        }
                    }
                %>
            </div>
        </div>
    </body>
</html>
