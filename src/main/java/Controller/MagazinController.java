package Controller;

import DAOImplement.MagazinDAOImplement;
import JavaBean.Magazin;
import com.oracle.wls.shaded.org.apache.xpath.operations.Or;
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
        if(request.getParameter("displayMagazine") != null){
            List<Magazin> magazinList = magazinDAO.displayMagazine();
            request.setAttribute("magazinList", magazinList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("displayMagazine.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(@NotNull HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("addMagazin") != null){
            magazin.setNUME_MAGAZIN(request.getParameter("NUME_MAGAZIN_add"));
            magazin.setTELEFON(request.getParameter("TELEFON_MAGAZIN_add"));
            magazin.setEMAIL(request.getParameter("EMAIL_MAGAZIN_add"));
            magazin.setORAS(request.getParameter("ORAS_MAGAZIN_add"));
            magazin.setADRESA(request.getParameter("ADRESA_MAGAZIN_add"));
            magazin.setCODPOSTAL(request.getParameter("COD_POSTAL_MAGAZIN_add"));

            magazinDAO.addMagazin(magazin);
            response.sendRedirect("/");
        }
        else if(request.getParameter("updateMagazin") != null){
            Long IDMAGAZIN = Long.parseLong(request.getParameter("Select_magazin_Update"));

            magazin = magazinDAO.getMagazin(IDMAGAZIN);

            String NUME_MAGAZIN = request.getParameter("NUME_MAGAZIN_update");
            String TELEFON = request.getParameter("TELEFON_update");
            String EMAIL = request.getParameter("EMAIL_update");
            String ORAS = request.getParameter("ORAS_update");
            String ADRESA = request.getParameter("ADRESA_update");
            String CODPOSTAL = request.getParameter("CODPOSTAL_update");

            NUME_MAGAZIN = (NUME_MAGAZIN.length() == 0) ? magazin.getNUME_MAGAZIN() : NUME_MAGAZIN;
            TELEFON = (TELEFON.length() == 0) ? magazin.getTELEFON() : TELEFON;
            EMAIL = (EMAIL.length() == 0) ? magazin.getEMAIL() : EMAIL;
            ORAS = (ORAS.length() == 0) ? magazin.getORAS() : ORAS;
            ADRESA = (ADRESA.length() == 0) ? magazin.getADRESA() : ADRESA;
            CODPOSTAL = (CODPOSTAL.length() == 0) ? magazin.getCODPOSTAL() : CODPOSTAL;


            magazinDAO.updateMagazin(IDMAGAZIN, NUME_MAGAZIN, TELEFON, EMAIL, ORAS, ADRESA, CODPOSTAL);
            response.sendRedirect("Magazine?displayMagazine=Tabelul+cu+magazine");
        }
        else if(request.getParameter("deleteMagazin") != null){
            Long idmagazin = Long.parseLong(request.getParameter("Select_Magazin_Delete"));
            magazin.setIDMAGAZIN(idmagazin);
            magazinDAO.deleteMagazin(magazin);
            response.sendRedirect("Magazine?displayMagazine=Tabelul+cu+magazine");
        }
    }
}
