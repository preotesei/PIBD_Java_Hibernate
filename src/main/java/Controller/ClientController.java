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
    protected void doPost(@NotNull HttpServletRequest request, HttpServletResponse response) throws IOException {
        if(request.getParameter("addClient") != null){
            client.setCNP(request.getParameter("cnp_add"));
            client.setNUME(request.getParameter("nume_add"));
            client.setPRENUME(request.getParameter("prenume_add"));
            client.setTELEFON(request.getParameter("telefon_add"));
            client.setEMAIL(request.getParameter("email_add"));
            client.setORAS(request.getParameter("oras_add"));
            client.setADRESA(request.getParameter("adresa_add"));
            client.setCODPOSTAL(request.getParameter("cod_postal_add"));

            clientDAO.addClient(client);
            response.sendRedirect("/");
        }
        else if(request.getParameter("updateClient") != null){
            Long idclient = Long.parseLong(request.getParameter("Select_client_Update"));

            client = clientDAO.getClient(idclient);

            String cnp = request.getParameter("CNP_update");
            String Nume = request.getParameter("Nume_update");
            String Prenume = request.getParameter("Prenume_update");
            String Telefon = request.getParameter("Telefon_update");
            String Email = request.getParameter("Email_update");
            String Oras = request.getParameter("oras_update");
            String Adresa = request.getParameter("adresa_update");
            String Cod_Postal = request.getParameter("cod_postal_update");

            cnp = (cnp.length() == 0) ? client.getCNP() : cnp;
            Nume = (Nume.length() == 0) ? client.getNUME() : Nume;
            Prenume = (Prenume.length() == 0) ? client.getPRENUME() : Prenume;
            Telefon = (Telefon.length() == 0) ? client.getTELEFON() : Telefon;
            Email = (Email.length() == 0) ? client.getEMAIL() : Email;
            Oras = (Oras.length() == 0) ? client.getORAS() : Oras;
            Adresa = (Adresa.length() == 0) ? client.getADRESA() : Adresa;
            Cod_Postal = (Cod_Postal.length() == 0) ? client.getCODPOSTAL() : Cod_Postal;

            clientDAO.updateClient(idclient, cnp, Nume, Prenume, Telefon, Email, Oras, Adresa, Cod_Postal);
            response.sendRedirect("Clienti?displayClienti=Tabelul+cu+clienti");
        }
        else if(request.getParameter("deleteClient") != null){
            Long idclient = Long.parseLong(request.getParameter("Select_client_Delete"));
            client.setIDCLIENT(idclient);
            clientDAO.deleteClient(client);
            response.sendRedirect("Clienti?displayClienti=Tabelul+cu+clienti");
        }
    }
}

