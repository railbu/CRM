package crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import crm.dao.MeasureDao;
import crm.model.Customer;

@Component
public class MeasureService {
	@Autowired private MeasureDao measureDao;
	
	public int countAllByRes(String query_cus, String query_user, String query_state){
		return this.measureDao.countAllByRes(query_cus, query_user, query_state);
	}
	
	public List<Customer> list(int pageNo,int pageSize,String query_cus, String query_user, String query_state){
		return this.measureDao.list(pageNo,pageSize,query_cus, query_user, query_state);
	}
}
