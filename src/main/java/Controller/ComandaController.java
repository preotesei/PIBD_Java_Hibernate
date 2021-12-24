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
import net.bytebuddy.asm.Advice;
import org.hibernate.Session;
import org.jetbrains.annotations.NotNull;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class ComandaController extends HttpServlet {
    Comanda comanda = new Comanda();
    ComandaDAOImplement comandaDAO = new ComandaDAOImplement();

    @Override
    protected void doGet(@NotNull HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("addComanda") != null){
            Long idclient = Long.parseLong(request.getParameter("idclient"));
            Long idmagazin = Long.parseLong(request.getParameter("idmagazin"));
            Session session = HibernateUtil.getSessionFactory().openSession();
            comanda.setClient(session.get(Client.class, idclient));
            comanda.setMagazin(session.get(Magazin.class, idmagazin));
            session.close();

            comanda.setStatus_comanda(request.getParameter("status_comanda"));

            DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("dd.MM.yyyy");
            comanda.setData_plasarii(LocalDate.parse(request.getParameter("data_plasarii"), dateFormat));


            DateTimeFormatter timeFormat = DateTimeFormatter.ofPattern("HH:mm:ss");
            comanda.setOra_plasarii(LocalTime.parse(request.getParameter("ora_plasarii"), timeFormat));

            comanda.setData_livrarii(LocalDate.parse(request.getParameter("data_livrarii"), dateFormat));
            comanda.setOra_livrarii(LocalTime.parse(request.getParameter("ora_livrarii"), timeFormat));

            comandaDAO.addComanda(comanda);
            RequestDispatcher dispatcher = request.getRequestDispatcher("addComanda.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(@NotNull HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("displayComenzi") != null){
            List<Comanda> comandaList = comandaDAO.displayComenzi();
            request.setAttribute("comandaList", comandaList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("displayComenzi.jsp");
            dispatcher.forward(request, response);
        }
        if(request.getParameter("deleteComanda") != null){
            Long idcomanda = Long.parseLong(request.getParameter("idcomanda"));
            comandaDAO.deleteComanda(comanda);
            RequestDispatcher dispatcher = request.getRequestDispatcher("deleteComanda.jsp");
            dispatcher.forward(request, response);
        }
        if(request.getParameter("updateComanda") != null){
            Long idcomanda = Long.parseLong(request.getParameter("idcomanda"));
            Session session = HibernateUtil.getSessionFactory().openSession();
            Long idclient = Long.parseLong(request.getParameter("idclient"));
            Long idmagazin = Long.parseLong(request.getParameter("idmagazin"));
            Client client = session.get(Client.class, idclient);
            Magazin magazin = session.get(Magazin.class, idmagazin);

            String status_comanda = request.getParameter("status_comanda");

            DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("dd.MM.yyyy");
            DateTimeFormatter timeFormat = DateTimeFormatter.ofPattern("HH:mm:ss");

            LocalDate data_plasarii = LocalDate.parse(request.getParameter("data_plasarii"), dateFormat);
            LocalTime ora_plasarii = LocalTime.parse(request.getParameter("ora_plasarii"), timeFormat);

            LocalDate data_livrarii = LocalDate.parse(request.getParameter("data_livrarii"), dateFormat);
            LocalTime ora_livrarii = LocalTime.parse(request.getParameter("ora_livrarii"), timeFormat);

            comandaDAO.updateComanda(idcomanda, status_comanda, data_plasarii, ora_plasarii, data_livrarii, ora_livrarii, client, magazin);
            RequestDispatcher dispatcher = request.getRequestDispatcher("updateComanda.jsp");
            dispatcher.forward(request, response);
            session.close();
        }
    }
}
