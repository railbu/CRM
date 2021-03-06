package crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import crm.dao.CustomerServiceDao;
import crm.model.Customer_service;
import crm.model.ServiceItem;
import crm.model.User;

@Component
public class CustomerServiceService {
	@Autowired private CustomerServiceDao customerServiceDao;
	
	public void save(Customer_service cs){
		customerServiceDao.save(cs);
	}
	
	public Customer_service load(Long id){
	    return customerServiceDao.load(id);
	}
	
	public List<Customer_service> findByPage(int pageNo,int pageSize){
		return customerServiceDao.findByPage(pageNo, pageSize);
	}
	
	public List<Customer_service> findByPageAndType(int pageNo,int pageSize,String type){
		return customerServiceDao.findByPageAndType(pageNo, pageSize,type);
	}
	
	public int countAll(){
		return customerServiceDao.countAll();
	}
	
	public int countAllByType(String type){
		return customerServiceDao.countAllByType(type);
	}
	
	public void updateState(ServiceItem si){
		customerServiceDao.updateState(si);
	}
	
	public int countAllAndRes(String type, String sCusName,String sSum,String sType,String st,String et,User user){
		return customerServiceDao.countAllAndRes(type, sCusName, sSum, sType, st, et,user);
	}
	
	public List<Customer_service> findByPageAndRes(int pageNo,int pageSize,String type,String sCusName,String sSum,String sType,String st,String et,User user){
		return customerServiceDao.findByPageAndRes(pageNo, pageSize, type, sCusName, sSum, sType, st, et, user);
	}
}
