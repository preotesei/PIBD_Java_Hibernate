package DAOImplement;

import DAO.ComandaDAO;
import JavaBean.Client;
import JavaBean.Comanda;
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
        comanda.setStatus_comanda(status_comanda);
        comanda.setData_plasarii(data_plasarii);
        comanda.setOra_plasarii(ora_plasarii);
        comanda.setData_livrarii(data_livrarii);
        comanda.setOra_livrarii(ora_livrarii);
        comanda.setClient(client);
        comanda.setMagazin(magazin);
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
}
