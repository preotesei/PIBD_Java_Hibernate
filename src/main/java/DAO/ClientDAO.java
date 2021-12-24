package DAO;

import JavaBean.Client;
import JavaBean.Comanda;

import java.util.List;
import java.util.Set;

public interface ClientDAO {

    void addClient(Client client);

    void deleteClient(Client client);

    void updateClient(Long idclient, String cnp, String nume, String prenume, String telefon, String email, String oras, String adresa, String cod_Postal);

    List<Client> displayClienti();

}
