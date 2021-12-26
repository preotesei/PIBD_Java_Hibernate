package DAO;

import JavaBean.Client;
import JavaBean.Comanda;
import JavaBean.Magazin;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

public interface ComandaDAO {

    void addComanda(Comanda comanda);

    void deleteComanda(Comanda comanda);

    void updateComanda(Long idcomanda, String status_comanda, LocalDate data_plasarii, LocalTime ora_plasarii, LocalDate data_livrarii, LocalTime ora_livrarii, Client client, Magazin magazin);

    Comanda getComanda(Long idcomanda);

    List<Comanda> displayComenzi();

}
