package controladores;

import DAO.MensajesDAO;
import DAO.MensajesDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import modelo.Mensajes;


@WebServlet(name = "EnviarMensaje", urlPatterns = {"/EnviarMensaje"})
public class EnviarMensaje extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Mensajes mensaje = new Mensajes();
        MensajesDAO msgdao = new MensajesDAOImpl();
        int IdUEnvio = Integer.parseInt(request.getParameter("Usuario"));
        int IdUDestino = Integer.parseInt(request.getParameter("Destinatario"));
        String msg = request.getParameter("mensaje");
        
        mensaje.setIdUEnvio(IdUEnvio);
        mensaje.setIdURecibido(IdUDestino);
        mensaje.setMensaje(msg);
        
        msgdao.EnviarMensaje(mensaje);
        response.sendRedirect("Chat.jsp");
    }
}
