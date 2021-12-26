package Controller;

import DAOImplement.ClientDAOImplement;
import JavaBean.Client;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jetbrains.annotations.NotNull;

import java.io.IOException;
import java.net.http.HttpClient;
import java.util.List;

public class ClientController extends HttpServlet {
    Client client = new Client();
    ClientDAOImplement clientDAO = new ClientDAOImplement();

    @Override
    protected void doGet(@NotNull HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(request.getParameter("displayClienti") != null){
            List<Client> clientList = clientDAO.displayClienti();
            request.setAttribute("clientList", clientList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("displayClienti.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(@NotNull HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("addClient") != null){
            client.setCnp(request.getParameter("cnp"));
            client.setNume(request.getParameter("Nume"));
            client.setPrenume(request.getParameter("Prenume"));
            client.setTelefon(request.getParameter("Telefon"));
            client.setEmail(request.getParameter("Email"));
            client.setOras(request.getParameter("Oras"));
            client.setAdresa(request.getParameter("Adresa"));
            client.setCod_Postal(request.getParameter("Cod Postal"));

            clientDAO.addClient(client);
            RequestDispatcher dispatcher = request.getRequestDispatcher("addClient.jsp");
            dispatcher.forward(request, response);
        }
        if(request.getParameter("deleteClient") != null){
            Long idclient = Long.parseLong(request.getParameter("idclient"));
            client.setIdclient(idclient);
            clientDAO.deleteClient(client);
            RequestDispatcher dispatcher = request.getRequestDispatcher("deleteClient.jsp");
            dispatcher.forward(request, response);
        }
        if(request.getParameter("updateClient") != null){
            Long idclient = Long.parseLong(request.getParameter("idclient"));
            String cnp = request.getParameter("cnp");
            String Nume = request.getParameter("Nume");
            String Prenume = request.getParameter("Prenume");
            String Telefon = request.getParameter("Telefon");
            String Email = request.getParameter("Email");
            String Oras = request.getParameter("Oras");
            String Adresa = request.getParameter("Adresa");
            String Cod_Postal = request.getParameter("Cod Postal");

            clientDAO.updateClient(idclient, cnp, Nume, Prenume, Telefon, Email, Oras, Adresa, Cod_Postal);
            RequestDispatcher dispatcher = request.getRequestDispatcher("updateClient.jsp");
            dispatcher.forward(request, response);
        }
    }
}

