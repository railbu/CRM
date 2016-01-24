package crm.dao;

import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Component;

import crm.model.ContactRecord;

@Component
public class ContactRecordDao extends HibernateDaoSupport {

	public ContactRecord loadContactRecord(Long id){
		return (ContactRecord) super.getSession().load(ContactRecord.class,id);
	}
	
	public ContactRecord save(ContactRecord contactRecord){
		super.getSession().saveOrUpdate(contactRecord);
		return contactRecord;
	}
	
	public ContactRecord findContactRecord(Long id) {
		return (ContactRecord) super.getSession()
				.createCriteria(ContactRecord.class)
				.add(Restrictions.eq("id",id))
				.uniqueResult();
		
	}
	
	public void delete(Long id) {
		super.getSession().delete(super.getSession().load(ContactRecord.class, id));
	}
	
}
