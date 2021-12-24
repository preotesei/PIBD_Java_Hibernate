package JavaBean;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;

public class Comanda implements Serializable {

    private Long idcomanda;
    private String status_comanda;
    private LocalDate data_plasarii;
    private LocalTime ora_plasarii;
    private LocalDate data_livrarii;
    private LocalTime ora_livrarii;
    private Client client;
    private Magazin magazin;

    public Comanda() { }

    public Long getIdcomanda() {
        return idcomanda;
    }

    public void setIdcomanda(Long idcomanda) {
        this.idcomanda = idcomanda;
    }

    public String getStatus_comanda() {
        return status_comanda;
    }

    public void setStatus_comanda(String status_comanda) {
        this.status_comanda = status_comanda;
    }

    public LocalDate getData_plasarii() {
        return data_plasarii;
    }

    public void setData_plasarii(LocalDate data_plasarii) {
        this.data_plasarii = data_plasarii;
    }

    public LocalTime getOra_plasarii() {
        return ora_plasarii;
    }

    public void setOra_plasarii(LocalTime ora_plasarii) {
        this.ora_plasarii = ora_plasarii;
    }

    public LocalDate getData_livrarii() {
        return data_livrarii;
    }

    public void setData_livrarii(LocalDate data_livrarii) {
        this.data_livrarii = data_livrarii;
    }

    public LocalTime getOra_livrarii() {
        return ora_livrarii;
    }

    public void setOra_livrarii(LocalTime ora_livrarii) {
        this.ora_livrarii = ora_livrarii;
    }

    public Client getClient() {
        return new Client(client);
    }

    public void setClient(Client client) {
        this.client = new Client(client);
    }

    public Magazin getMagazin() {
        return new Magazin(magazin);
    }

    public void setMagazin(Magazin magazin) {
        this.magazin = new Magazin(magazin);
    }
}


