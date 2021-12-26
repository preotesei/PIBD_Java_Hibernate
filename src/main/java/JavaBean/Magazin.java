package JavaBean;

import org.jetbrains.annotations.NotNull;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Magazin implements Serializable {
    private Long IDMAGAZIN;
    private String NUME_MAGAZIN;
    private String TELEFON;
    private String EMAIL;
    private String ORAS;
    private String ADRESA;
    private String CODPOSTAL;
    private Set<Comanda> COMENZI = new HashSet<>();

    public Magazin() { }

    public Magazin(Long IDMAGAZIN, String NUME_MAGAZIN, String TELEFON, String EMAIL, String ORAS, String ADRESA, String CODPOSTAL, Set<Comanda> COMENZI) {
        this.IDMAGAZIN = IDMAGAZIN;
        this.NUME_MAGAZIN = NUME_MAGAZIN;
        this.TELEFON = TELEFON;
        this.EMAIL = EMAIL;
        this.ORAS = ORAS;
        this.ADRESA = ADRESA;
        this.CODPOSTAL = CODPOSTAL;
        this.COMENZI = new HashSet<>(COMENZI);
    }

    public Magazin(@NotNull Magazin magazin){
        this.IDMAGAZIN = magazin.getIDMAGAZIN();
        this.NUME_MAGAZIN = magazin.getNUME_MAGAZIN();
        this.TELEFON = magazin.getTELEFON();
        this.EMAIL = magazin.getEMAIL();
        this.ORAS = magazin.getORAS();
        this.ADRESA = magazin.getADRESA();
        this.CODPOSTAL = magazin.getCODPOSTAL();
        this.COMENZI = new HashSet<>(magazin.getCOMENZI());
    }

    public Long getIDMAGAZIN() {
        return IDMAGAZIN;
    }

    public void setIDMAGAZIN(Long idmagazin) {
        this.IDMAGAZIN = idmagazin;
    }

    public String getNUME_MAGAZIN() {
        return NUME_MAGAZIN;
    }

    public void setNUME_MAGAZIN(String nume_magazin) {
        this.NUME_MAGAZIN = nume_magazin;
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

    public void setCOMENZI(Set<Comanda> comenzi) {
        this.COMENZI = new HashSet<>(comenzi);
    }
}
