package DAOImplement;

import DAO.MagazinDAO;
import JavaBean.Client;
import JavaBean.Magazin;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class MagazinDAOImplement implements MagazinDAO{
    @Override
    public void addMagazin(Magazin magazin){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(magazin);
        transaction.commit();
        session.close();
    }

    @Override
    public void deleteMagazin(Magazin magazin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(magazin);
        transaction.commit();
        session.close();
    }

    @Override
    public void updateMagazin(Long idmagazin, String nume_magazin, String telefon, String email, String oras, String adresa, String cod_Postal) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Magazin magazin = session.load(Magazin.class, idmagazin);
        magazin.setNUME_MAGAZIN(nume_magazin);
        magazin.setTELEFON(telefon);
        magazin.setEMAIL(email);
        magazin.setORAS(oras);
        magazin.setADRESA(adresa);
        magazin.setCODPOSTAL(cod_Postal);
        session.update(magazin);
        transaction.commit();
        session.close();
    }

    @Override
    public List<Magazin> displayMagazine() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Magazin> magazinList = session.createQuery("from Magazin").list();
        session.close();
        return magazinList;
    }

    @Override
    public Magazin getMagazin(Long idmagazin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Magazin magazin = session.load(Magazin.class, idmagazin);
        session.close();
        return magazin;
    }
}
