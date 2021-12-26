package DAOImplement;

import DAO.ComandaDAO;
import JavaBean.Client;
import JavaBean.Comanda;
import JavaBean.Magazin;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

public class ComandaDAOImplement implements ComandaDAO{

    @Override
    public void addComanda(Comanda comanda){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(comanda);
        transaction.commit();
        session.close();
    }

    @Override
    public void deleteComanda(Comanda comanda) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(comanda);
        transaction.commit();
        session.close();
    }

    @Override
    public void updateComanda(Long idcomanda, String status_comanda, LocalDate data_plasarii, LocalTime ora_plasarii, LocalDate data_livrarii, LocalTime ora_livrarii, Client client, Magazin magazin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Comanda comanda = session.load(Comanda.class, idcomanda);
        comanda.setSTATUS_COMANDA(status_comanda);
        comanda.setDATA_PLASARII(data_plasarii);
        comanda.setORA_PLASARII(ora_plasarii);
        comanda.setDATA_LIVRARII(data_livrarii);
        comanda.setORA_LIVRARII(ora_livrarii);
        comanda.setCLIENT(client);
        comanda.setMAGAZIN(magazin);
        session.update(comanda);
        transaction.commit();
        session.close();
    }

    @Override
    public List<Comanda> displayComenzi() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Comanda> comandaList = session.createQuery("from Comanda").list();
        session.close();
        return comandaList;
    }

    @Override
    public Comanda getComanda(Long idcomanda) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Comanda comanda = session.load(Comanda.class, idcomanda);
        session.close();
        return comanda;
    }
}
