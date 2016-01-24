package crm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import crm.dao.ContactRecordDao;
import crm.model.ContactRecord;

@Component
public class ContactRecordService {
	
	@Autowired private ContactRecordDao contactRecordDao;

	public ContactRecord loadContactRecord(Long id){
		return this.contactRecordDao.loadContactRecord(id);
	}
	
	public ContactRecord save(ContactRecord contactRecord) {
		return this.contactRecordDao.save(contactRecord);
	}
	
	public ContactRecord findContactRecord(Long id) {
		return this.contactRecordDao.findContactRecord(id);
	}
	
	public void delete(Long id) {
		this.contactRecordDao.delete(id);
	}
}
