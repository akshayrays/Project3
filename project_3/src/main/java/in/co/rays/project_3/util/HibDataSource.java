package in.co.rays.project_3.util;

import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * Hibernate DataSource is provides the object of sessionfactory and session
 * 
 * @author Akshay
 *
 */
public class HibDataSource {
	private static SessionFactory sessionFactory = null;

	public static SessionFactory getSessionFactory() {
     
		//getSessionFactory session Factory ka object return kar rai hai
		if (sessionFactory == null) {
			sessionFactory = new Configuration().configure().buildSessionFactory();

		}
		// Configuration() ek class hai configure()=ki method hai Configuration()
		// configure()=ki method buildSessionFactory();
		// Configuration() khali hai isliye use kiya q ki humko configure() chiye
		// configure(Akshay.cfg.xml) rename karna hoto aisa krna padhega
		// buildSessionFactory() isse session factory return kara.
		// sessionFactory isliye liya q ki humko session ka obj banana tha

		return sessionFactory;

	}

	public static Session getSession() {
		
		//getSession session ka obj return kar rai hai

		Session session = getSessionFactory().openSession();
		return session;
		// .getCurrentSesion() jab transaction end hoga automatically session flush ho
		// jayega
		// bound to lifecycle of transaction to session bn ho jayega

	}

	public static void closeSession(Session session) {

		if (session != null) {
			session.close();
		}
	}
}
