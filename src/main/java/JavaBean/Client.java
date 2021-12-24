package JavaBean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Client implements Serializable {

    private Long idclient;
    private String cnp;
    private String Nume;
    private String Prenume;
    private String Telefon;
    private String Email;
    private String Oras;
    private String Adresa;
    private String Cod_Postal;
    private Set<Comanda> comenzi = new HashSet<>();

    public Client() {}

    public Client(Long idclient, String cnp, String nume, String prenume, String telefon, String email, String oras, String adresa, String cod_Postal, Set<Comanda> comenzi) {
        this.idclient = idclient;
        this.cnp = cnp;
        Nume = nume;
        Prenume = prenume;
        Telefon = telefon;
        Email = email;
        Oras = oras;
        Adresa = adresa;
        Cod_Postal = cod_Postal;
        this.comenzi = new HashSet<>(comenzi);
    }

    public Client(Client client){
        this.idclient = client.getIdclient();
        this.cnp = client.getCnp();
        this.Nume = client.getNume();
        this.Prenume = client.getPrenume();
        this.Telefon = client.getTelefon();
        this.Email = client.getEmail();
        this.Oras = client.getOras();
        this.Adresa = client.getAdresa();
        this.Cod_Postal = client.getCod_Postal();
        this.comenzi = new HashSet<>(client.getComenzi());
    }

    public Long getIdclient() {
        return idclient;
    }

    public void setIdclient(Long idclient) {
        this.idclient = idclient;
    }

    public String getCnp() {
        return cnp;
    }

    public void setCnp(String cnp) {
        this.cnp = cnp;
    }

    public String getNume() {
        return Nume;
    }

    public void setNume(String nume) {
        Nume = nume;
    }

    public String getPrenume() {
        return Prenume;
    }

    public void setPrenume(String prenume) {
        Prenume = prenume;
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
