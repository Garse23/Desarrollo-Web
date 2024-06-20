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
    </head>
    <% String nombreUsuario = (String) session.getAttribute("nombreUsuario");
   Integer rolUsuario = (Integer) session.getAttribute("rolUsuario");%>
    <body>
        <header>
            <nav class="navbar navbar-dark">
                <div class="row w-100 align-items-center text-end">
                    <div class="col-3 text-start">
                        <img src="imagenes/logo.png" alt="logo" class="" style="width:100px">
                    </div>
                    <%if (nombreUsuario != null) {
                    %>
                    <div class="col-3"></div>
                    <div class="col-2">
                        <span>Usuario: <%= nombreUsuario %></span>
                    </div>
                    <% 
                if (rolUsuario != null) {
                    switch(rolUsuario) {
                        case 1:
                    %>
                    <button type="button" class="btn btn-success"><a href="paginaEmpleado.jsp" class="btn">Empleado</a></button>
                    <%
                                    break;
                                case 2:
                    %>
                    <a href="paginaProveedor.jsp" class="btn btn-success">Proveedor</a>
                    <%
                                    break;
                                case 4:
                    %>
                    <div class="col-1">
                        <a href="paginaEmpleado.jsp" class="btn btn-success">Empleado</a>
                    </div>
                    <div class="col-1">
                        <a href="paginaProveedor.jsp" class="btn btn-success">Proveedor</a>
                    </div>
                    <%
                    default:
                        break;
                }
            } 
                    %>
                    <div class="col-1">
                        <a href="CerrarSesion"><img src="imagenes/cerrar.png" alt="Cerrar sesión" class="align-items-center" style="width: 50px"></a>
                    </div>
                    <% 
                        } else {
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
                        <img src="imagenes/carrito.png" alt=""style="width: 100px">
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
                            <a href="#categorias" class="btn btn-outline-light">Categorías</a>
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
                    <div class="card-body">
                        <img src="imagenes/anuncio.png" alt="Producto" style="width: 100%">
                        <h3><%= producto.getNomProducto()%></h3>
                        <p>Precio: $<%= producto.getPrecioProducto() %></p>
                        <button class="btn btn-success">Agregar al carrito</button>
                    </div>
                </div>
                <% 
                        }
                    }
                %>
            </div>
        </div>
    </body>
</html>
