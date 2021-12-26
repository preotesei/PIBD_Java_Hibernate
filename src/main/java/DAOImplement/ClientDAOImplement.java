package DAOImplement;

import DAO.ClientDAO;
import JavaBean.Client;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class ClientDAOImplement implements ClientDAO{

    @Override
    public void addClient(Client client){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(client);
        transaction.commit();
        session.close();
    }

    @Override
    public void deleteClient(Client client) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(client);
        transaction.commit();
        session.close();
    }

    @Override
    public void updateClient(Long idclient, String cnp, String nume, String prenume, String telefon, String email, String oras, String adresa, String cod_Postal) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Client client = session.load(Client.class, idclient);
        client.setCNP(cnp);
        client.setNUME(nume);
        client.setPRENUME(prenume);
        client.setTELEFON(telefon);
        client.setEMAIL(email);
        client.setORAS(oras);
        client.setADRESA(adresa);
        client.setCODPOSTAL(cod_Postal);
        session.update(client);
        transaction.commit();
        session.close();
    }

    @Override
    public List<Client> displayClienti() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Client> clientList = session.createQuery("from Client").list();
        session.close();
        return clientList;
    }

    @Override
    public Client getClient(Long idclient) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Client client = session.load(Client.class, idclient);
        session.close();
        return client;
    }
}
