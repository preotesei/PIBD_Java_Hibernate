package JavaBean;

import org.jetbrains.annotations.NotNull;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Client implements Serializable {

    private Long IDCLIENT;
    private String CNP;
    private String NUME;
    private String PRENUME;
    private String TELEFON;
    private String EMAIL;
    private String ORAS;
    private String ADRESA;
    private String CODPOSTAL;
    private Set<Comanda> COMENZI = new HashSet<>();

    public Client() {}

    public Client(Long IDCLIENT, String CNP, String NUME, String PRENUME, String TELEFON, String EMAIL, String ORAS, String ADRESA, String CODPOSTAL, Set<Comanda> COMENZI) {
        this.IDCLIENT = IDCLIENT;
        this.CNP = CNP;
        this.NUME = NUME;
        this.PRENUME = PRENUME;
        this.TELEFON = TELEFON;
        this.EMAIL = EMAIL;
        this.ORAS = ORAS;
        this.ADRESA = ADRESA;
        this.CODPOSTAL = CODPOSTAL;
        this.COMENZI = new HashSet<>(COMENZI);
    }

    public Client(@NotNull Client client){
        this.IDCLIENT = client.getIDCLIENT();
        this.CNP = client.getCNP();
        this.NUME = client.getNUME();
        this.PRENUME = client.getPRENUME();
        this.TELEFON = client.getTELEFON();
        this.EMAIL = client.getEMAIL();
        this.ORAS = client.getORAS();
        this.ADRESA = client.getADRESA();
        this.CODPOSTAL = client.getCODPOSTAL();
        this.COMENZI = new HashSet<>(client.getCOMENZI());
    }

    public Long getIDCLIENT() {
        return IDCLIENT;
    }

    public void setIDCLIENT(Long IDCLIENT) {
        this.IDCLIENT = IDCLIENT;
    }

    public String getCNP() {
        return CNP;
    }

    public void setCNP(String CNP) {
        this.CNP = CNP;
    }

    public String getNUME() {
        return NUME;
    }

    public void setNUME(String NUME) {
        this.NUME = NUME;
    }

    public String getPRENUME() {
        return PRENUME;
    }

    public void setPRENUME(String PRENUME) {
        this.PRENUME = PRENUME;
    }

    public String getTELEFON() {
        return TELEFON;
    }

    public void setTELEFON(String TELEFON) {
        this.TELEFON = TELEFON;
    }

    public String getEMAIL() {
        return EMAIL;
    }

    public void setEMAIL(String EMAIL) {
        this.EMAIL = EMAIL;
    }

    public String getORAS() {
        return ORAS;
    }

    public void setORAS(String ORAS) {
        this.ORAS = ORAS;
    }

    public String getADRESA() {
        return ADRESA;
    }

    public void setADRESA(String ADRESA) {
        this.ADRESA = ADRESA;
    }

    public String getCODPOSTAL() {
        return CODPOSTAL;
    }

    public void setCODPOSTAL(String CODPOSTAL) {
        this.CODPOSTAL = CODPOSTAL;
    }

    public Set<Comanda> getCOMENZI() {
        return new HashSet<>(COMENZI);
    }

    public void setCOMENZI(Set<Comanda> COMENZI) {
        this.COMENZI = new HashSet<>(COMENZI);
    }
}
