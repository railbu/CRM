package crm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import crm.dao.ContactDao;
import crm.model.Contact;

@Component
public class ContactService {
	
	@Autowired private ContactDao contactDao;
	
		public Contact findContact(String contactName){
			return this.contactDao.findContact(contactName);
		}
		
		public Contact findContactById(Long id){
			return this.contactDao.findContactById(id);
		}
		
	
		public void delContact(Contact contact) {
			// TODO Auto-generated method stub
			this.contactDao.delContact(contact);
		}

}
