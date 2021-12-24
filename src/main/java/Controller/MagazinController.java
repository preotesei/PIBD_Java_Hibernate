package Controller;

import DAOImplement.MagazinDAOImplement;
import JavaBean.Magazin;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jetbrains.annotations.NotNull;

import java.io.IOException;
import java.util.List;

public class MagazinController extends HttpServlet {
    Magazin magazin = new Magazin();
    MagazinDAOImplement magazinDAO = new MagazinDAOImplement();

    @Override
    protected void doGet(@NotNull HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("addMagazin") != null){
            magazin.setNume_magazin(request.getParameter("nume_magazin"));
            magazin.setTelefon(request.getParameter("Telefon"));
            magazin.setEmail(request.getParameter("Email"));
            magazin.setOras(request.getParameter("Oras"));
            magazin.setAdresa(request.getParameter("Adresa"));
            magazin.setCod_Postal(request.getParameter("Cod_Postal"));

            magazinDAO.addMagazin(magazin);
            RequestDispatcher dispatcher = request.getRequestDispatcher("addMagazin.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("displayMagazine") != null){
            List<Magazin> magazinList = magazinDAO.displayMagazine();
            request.setAttribute("magazinList", magazinList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("displayMagazine.jsp");
            dispatcher.forward(request, response);
        }
        if(request.getParameter("deleteMagazin") != null){
            Long idmagazin = Long.parseLong(request.getParameter("idmagazin"));
            magazin.setIdmagazin(idmagazin);
            magazinDAO.deleteMagazin(magazin);
            RequestDispatcher dispatcher = request.getRequestDispatcher("deleteMagazin.jsp");
            dispatcher.forward(request, response);
        }
        if(request.getParameter("updateMagazin") != null){
            Long idmagazin = Long.parseLong(request.getParameter("idmagazin"));
            String nume_magazin = request.getParameter("nume_magazin");
            String Telefon = request.getParameter("Telefon");
            String Email = request.getParameter("Email");
            String Oras = request.getParameter("Oras");
            String Adresa = request.getParameter("Adresa");
            String Cod_Postal = request.getParameter("Cod_Postal");

            magazinDAO.updateMagazin(idmagazin, nume_magazin, Telefon, Email, Oras, Adresa, Cod_Postal);
            RequestDispatcher dispatcher = request.getRequestDispatcher("updateMagazin.jsp");
            dispatcher.forward(request, response);
        }
    }
}
