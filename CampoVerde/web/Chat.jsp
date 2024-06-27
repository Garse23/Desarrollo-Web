<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Usuario" %>
<%@ page import="DAO.UsuarioDAO" %>
<%@ page import="DAO.UsuarioDAOImpl" %>
<%@ page import="modelo.Mensajes" %>
<%@ page import="DAO.MensajesDAO" %>
<%@ page import="DAO.MensajesDAOImpl" %>
<%@ page import="java.sql.Date"%>
<%@ page import="java.sql.Time"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mensaje</title>

        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <styles>
    </styles>
</head>
<body>
    <% String nombreUsuario = (String) session.getAttribute("nombreUsuario");
    String NombreDestino = (String) session.getAttribute("NombreDestinatario");
  Integer IdUsuario = (Integer) session.getAttribute("idUsuario");
  Integer IdDestino = (Integer) session.getAttribute("IdDestinatario");
Integer rolUsuario = (Integer) session.getAttribute("rolUsuario");
    if(IdUsuario==null){
    response.sendRedirect("index.jsp");
    }else{%>
    <header>
        <div class="container-fluid" style="background: #4caf50">
            <nav class="navbar navbar-brand">
                <div class="row w-100">
                    <div class="col-3">
                        <a href="index.jsp"><img src="imagenes/logo.png" alt="logo" class="logo" style="width:100px"></a>
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
    <nav>

    </nav>
    <div class="container-fluid">
        <div class="row w-100">
            <div class="col-2">
                <div class="card text-center">
                    <%
                    UsuarioDAO usuarioDAO = new UsuarioDAOImpl();
                    List<Usuario> usuarios = null;
                    try {
                        usuarios = usuarioDAO.obtenerUsuariosHabilitados();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    %>
                    <% for (Usuario usuario : usuarios) { %>        
                    <br>
                    <div class="container-fluid">
                        <div class="btn btn-outline-primary">
                            <form action="DefinirDestinatario" method="post" >
                                <input type="hidden" name="id" id="id" value="<%=usuario.getId()%>">
                                <label>Nombre: <%=usuario.getCorreo()%></label>
                                <br>
                                <label>Mensaje:</label><br>
                                <label>Conexion:</label><br>
                                <input type="submit" class="btn btn-outline-primary" value="Acceder">
                            </form>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
            <div class="col-10 text-end">
                <div class="card">
                    <div class="card-header">nombre</div>
                    <div class="card-body" >
                        <%
                        MensajesDAO mensajesDAO = new MensajesDAOImpl();
                        List<Mensajes> mensajes = null;
                        Mensajes mensaje = new Mensajes();
                        mensaje.setIdUEnvio(IdUsuario);
                        
                        if (IdDestino==null){
                        mensaje.setIdURecibido(0);
                        }else{
                        mensaje.setIdURecibido(IdDestino);
                        }
                        
                        try {
                        mensajes = mensajesDAO.obtenerMensajesDisponibles(mensaje);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        %>
                        <% Date fecha = null; %>

                        <% for (Mensajes msg : mensajes) { %>
                        <% if (fecha == null || !fecha.equals(msg.getFecha())) {
                        fecha = msg.getFecha(); %>
                        <div class="text-center"><%= msg.getFecha() %></div>
                        <hr>
                        <% } %>

                        <%if(msg.getIdUEnvio()==IdUsuario){%>
                        <div class="col-7 offset-5 text-end" >
                            <div class="row">
                                <div class="col-11">
                                    <%=msg.getMensaje()%>
                                </div>
                                <div class="col-1">
                                    <img src="imagenes/person-fill.svg" alt="alt"/>
                                </div>
                            </div>
                        </div>
                        <%}%>
                        <%if(msg.getIdURecibido()==IdUsuario){%>
                        <div class="row text-start">
                            <div class="col-1">
                                <img src="imagenes/person-fill.svg" alt="alt"/>
                            </div>
                            <div class="col-6 text-start" >
                                <%=msg.getMensaje()%>
                            </div>
                        </div>
                        <%}%>
                        <%}%>
                    </div>
                    <div class="card-footer">
                        <form action="EnviarMensaje" method="post">
                            <input type="hidden" name="Usuario" id="Usuario" value="<%=IdUsuario%>">
                            <input type="hidden" name="Destinatario" id="Destinatario" value="<%=IdDestino%>">
                            <input type="text" name="mensaje" id="mensaje">
                            <input type="submit" class="btn btn-outline-primary" value="Enviar">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%}%>
</body>
</html>
