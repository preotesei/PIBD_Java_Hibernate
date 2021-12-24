package JavaBean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Magazin implements Serializable {
    private Long idmagazin;
    private String nume_magazin;
    private String Telefon;
    private String Email;
    private String Oras;
    private String Adresa;
    private String Cod_Postal;
    private Set<Comanda> comenzi = new HashSet<>();

    public Magazin() { }

    public Magazin(Long idmagazin, String nume_magazin, String telefon, String email, String oras, String adresa, String cod_Postal, Set<Comanda> comenzi) {
        this.idmagazin = idmagazin;
        this.nume_magazin = nume_magazin;
        Telefon = telefon;
        Email = email;
        Oras = oras;
        Adresa = adresa;
        Cod_Postal = cod_Postal;
        this.comenzi = new HashSet<>(comenzi);
    }

    public Magazin(Magazin magazin){
        this.idmagazin = magazin.getIdmagazin();
        this.nume_magazin = magazin.getNume_magazin();
        this.Telefon = magazin.getTelefon();
        this.Email = magazin.getEmail();
        this.Oras = magazin.getOras();
        this.Adresa = magazin.getAdresa();
        this.Cod_Postal = magazin.getCod_Postal();
        this.comenzi = new HashSet<>(magazin.getComenzi());
    }

    public Long getIdmagazin() {
        return idmagazin;
    }

    public void setIdmagazin(Long idmagazin) {
        this.idmagazin = idmagazin;
    }

    public String getNume_magazin() {
        return nume_magazin;
    }

    public void setNume_magazin(String nume_magazin) {
        this.nume_magazin = nume_magazin;
    }

    public String getTelefon() {
        return Telefon;
    }

    public void setTelefon(String telefon) {
        Telefon = telefon;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getOras() {
        return Oras;
    }

    public void setOras(String oras) {
        Oras = oras;
    }

    public String getAdresa() {
        return Adresa;
    }

    public void setAdresa(String adresa) {
        Adresa = adresa;
    }

    public String getCod_Postal() {
        return Cod_Postal;
    }

    public void setCod_Postal(String cod_Postal) {
        Cod_Postal = cod_Postal;
    }

    public Set<Comanda> getComenzi() {
        return new HashSet<>(comenzi);
    }

    public void setComenzi(Set<Comanda> comenzi) {
        this.comenzi = new HashSet<>(comenzi);
    }
}
