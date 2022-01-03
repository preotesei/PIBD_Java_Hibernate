package Controller;

import DAOImplement.ComandaDAOImplement;
import DAOImplement.HibernateUtil;
import JavaBean.Client;
import JavaBean.Comanda;
import JavaBean.Magazin;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.jetbrains.annotations.NotNull;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class ComandaController extends HttpServlet {
    Comanda comanda = new Comanda();
    ComandaDAOImplement comandaDAO = new ComandaDAOImplement();

    @Override
    protected void doGet(@NotNull HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("displayComenzi") != null){
            List<Comanda> comandaList = comandaDAO.displayComenzi();
            request.setAttribute("comandaList", comandaList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("displayComenzi.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(@NotNull HttpServletRequest request, HttpServletResponse response) throws IOException {
        if(request.getParameter("addComanda") != null){
            Long IDCLIENT = Long.parseLong(request.getParameter("IDCLIENT_add"));
            Long IDMAGAZIN = Long.parseLong(request.getParameter("IDMAGAZIN_add"));
            Session session = HibernateUtil.getSessionFactory().openSession();
            comanda.setCLIENT(session.get(Client.class, IDCLIENT));
            comanda.setMAGAZIN(session.get(Magazin.class, IDMAGAZIN));
            session.close();

            comanda.setSTATUS_COMANDA(request.getParameter("STATUS_COMANDA_add"));

            DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            DateTimeFormatter timeFormat = DateTimeFormatter.ofPattern("HH:mm");

            comanda.setDATA_PLASARII(LocalDate.parse(request.getParameter("DATA_PLASARII_add"), dateFormat));
            comanda.setORA_PLASARII(LocalTime.parse(request.getParameter("ORA_PLASARII_add"), timeFormat));



            String DATA_LIVRARII_STRING = request.getParameter("DATA_LIVRARII_add");
            String ORA_LIVRARII_STRING = request.getParameter("ORA_LIVRARII_add");
            LocalDate DATA_LIVRARII = (DATA_LIVRARII_STRING.length() == 0) ? null : LocalDate.parse(DATA_LIVRARII_STRING, dateFormat);
            LocalTime ORA_LIVRARII = (ORA_LIVRARII_STRING.length() == 0) ? null : LocalTime.parse(ORA_LIVRARII_STRING, timeFormat);


            comanda.setDATA_LIVRARII(DATA_LIVRARII);
            comanda.setORA_LIVRARII(ORA_LIVRARII);

            comandaDAO.addComanda(comanda);
            response.sendRedirect("/");
        }

        else if(request.getParameter("updateComanda") != null){
            Long IDCOMANDA = Long.parseLong(request.getParameter("Select_comanda_Update"));

            comanda = comandaDAO.getComanda(IDCOMANDA);

            Client CLIENT = comanda.getCLIENT();
            Magazin MAGAZIN = comanda.getMAGAZIN();

            DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            DateTimeFormatter timeFormat = DateTimeFormatter.ofPattern("HH:mm");

            String STATUS_COMANDA = request.getParameter("STATUS_COMANDA_UPDATE");
            String DATA_PLASARII_STRING = request.getParameter("DATA_PLASARII_UPDATE");
            String ORA_PLASARII_STRING =request.getParameter("ORA_PLASARII_UPDATE");
            String DATA_LIVRARII_STRING = request.getParameter("DATA_LIVRARII_UPDATE");
            String ORA_LIVRARII_STRING = request.getParameter("ORA_LIVRARII_UPDATE");

            STATUS_COMANDA = (STATUS_COMANDA.length() == 0) ? comanda.getSTATUS_COMANDA() : STATUS_COMANDA;
            LocalDate DATA_PLASARII = (DATA_PLASARII_STRING.length() == 0) ? comanda.getDATA_PLASARII() : LocalDate.parse(DATA_PLASARII_STRING, dateFormat);
            LocalTime ORA_PLASARII = (ORA_PLASARII_STRING.length() == 0) ? comanda.getORA_PLASARII() : LocalTime.parse(ORA_PLASARII_STRING, timeFormat);
            LocalDate DATA_LIVRARII = (DATA_LIVRARII_STRING.length() == 0) ? comanda.getDATA_LIVRARII() : LocalDate.parse(DATA_LIVRARII_STRING, dateFormat);
            LocalTime ORA_LIVRARII = (ORA_LIVRARII_STRING.length() == 0) ? comanda.getORA_LIVRARII() : LocalTime.parse(ORA_LIVRARII_STRING, timeFormat);

            comandaDAO.updateComanda(IDCOMANDA, STATUS_COMANDA, DATA_PLASARII, ORA_PLASARII, DATA_LIVRARII, ORA_LIVRARII, CLIENT, MAGAZIN);

            response.sendRedirect("Comenzi?displayComenzi=Tabelul+cu+comenzi");
        }

        else if(request.getParameter("deleteComanda") != null){
            Long IDCOMANDA = Long.parseLong(request.getParameter("Select_comanda_Delete"));
            comanda = comandaDAO.getComanda(IDCOMANDA);
            comandaDAO.deleteComanda(comanda);
            response.sendRedirect("Comenzi?displayComenzi=Tabelul+cu+comenzi");
        }
    }
}
