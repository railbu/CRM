package crm.dao;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Component;

import crm.model.Contact;

@Component
public class ContactDao extends HibernateDaoSupport{

	

		public void delContact(Contact contact) {
			// TODO Auto-generated method stub
			super.getSession().delete(contact);
		}

		public Contact findContact(String contactName) {
			Session session = super.getSession();
			
			Contact contact = (Contact) session.createCriteria(Contact.class)
					.add(Restrictions.eq("name", contactName)).uniqueResult();
			
			return contact;
		}

		public Contact findContactById(Long id) {
			Session session = super.getSession();
			
			Contact contact = (Contact) session.createCriteria(Contact.class)
					.add(Restrictions.eq("id",id)).uniqueResult();
			return contact;
		}

}
