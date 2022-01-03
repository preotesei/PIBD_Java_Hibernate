package DAO;

import JavaBean.Magazin;

import java.util.List;

public interface MagazinDAO {

    void addMagazin(Magazin magazin);

    void deleteMagazin(Magazin magazin);

    void updateMagazin(Long idmagazin, String nume_magazin, String telefon, String email, String oras, String adresa, String cod_Postal);

    Magazin getMagazin(Long idmagazin);

    List<Magazin> displayMagazine();

}
