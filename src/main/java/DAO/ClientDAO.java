package DAO;

import JavaBean.Client;

import java.util.List;

public interface ClientDAO {

    void addClient(Client client);

    void deleteClient(Client client);

    void updateClient(Long idclient, String cnp, String nume, String prenume, String telefon, String email, String oras, String adresa, String cod_Postal);

    Client getClient(Long idclient);

    List<Client> displayClienti();

}
