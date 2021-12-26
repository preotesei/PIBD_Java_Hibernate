package JavaBean;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;

public class Comanda implements Serializable {

    private Long IDCOMANDA;
    private String STATUS_COMANDA;
    private LocalDate DATA_PLASARII;
    private LocalTime ORA_PLASARII;
    private LocalDate DATA_LIVRARII;
    private LocalTime ORA_LIVRARII;
    private Client CLIENT;
    private Magazin MAGAZIN;

    public Comanda() { }

    public Long getIDCOMANDA() {
        return IDCOMANDA;
    }

    public void setIDCOMANDA(Long idcomanda) {
        this.IDCOMANDA = idcomanda;
    }

    public String getSTATUS_COMANDA() {
        return STATUS_COMANDA;
    }

    public void setSTATUS_COMANDA(String status_comanda) {
        this.STATUS_COMANDA = status_comanda;
    }

    public LocalDate getDATA_PLASARII() {
        return DATA_PLASARII;
    }

    public void setDATA_PLASARII(LocalDate data_plasarii) {
        this.DATA_PLASARII = data_plasarii;
    }

    public LocalTime getORA_PLASARII() {
        return ORA_PLASARII;
    }

    public void setORA_PLASARII(LocalTime ora_plasarii) {
        this.ORA_PLASARII = ora_plasarii;
    }

    public LocalDate getDATA_LIVRARII() {
        return DATA_LIVRARII;
    }

    public void setDATA_LIVRARII(LocalDate data_livrarii) {
        this.DATA_LIVRARII = data_livrarii;
    }

    public LocalTime getORA_LIVRARII() {
        return ORA_LIVRARII;
    }

    public void setORA_LIVRARII(LocalTime ora_livrarii) {
        this.ORA_LIVRARII = ora_livrarii;
    }

    public Client getCLIENT() {
        return new Client(CLIENT);
    }

    public void setCLIENT(Client client) {
        this.CLIENT = new Client(client);
    }

    public Magazin getMAGAZIN() {
        return new Magazin(MAGAZIN);
    }

    public void setMAGAZIN(Magazin magazin) {
        this.MAGAZIN = new Magazin(magazin);
    }
}


