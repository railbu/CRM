package crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import crm.dao.CustomerDao;
import crm.model.Customer;
import crm.model.Rank;

@Component
public class CustomerService {

	@Autowired private CustomerDao customerDao;
	
	public List<Customer> findAll(){
		return this.customerDao.findAll();
	}
	
	public void save(Customer Customer){
		this.customerDao.save(Customer);
	}
	
	public Customer findCustomer(String Customername){
		return this.customerDao.findCustomer(Customername);
	}
	
	public Customer findCustomerById(Long id){
		return this.customerDao.findCustomerById(id);
	}
	
	public Customer getCustomer(Long id) {
		return this.customerDao.getCustomer(id);
	}
	
	public void delete(Long id) {
		this.customerDao.delete(id);
	}
	
	public int countAll(){
		return customerDao.countAll();
	}
	
	public int countAllLost(){
		return customerDao.countAllLost();
	}
	
	public int countByRank(Rank rank) {
		return customerDao.countByRank(rank);
	}
	
	public int countByCredit(String credit) {
		return customerDao.countByCredit(credit);
	}
	
	public int countBySatisfication(String satisfication) {
		return customerDao.countBySatisfication(satisfication);
	}
	
	public List<Customer> findByPage(int pageNo,int pageSize){
		return customerDao.findByPage(pageNo, pageSize);
	}
	
	public List<Customer> findLostByPage(int pageNo,int pageSize){
		return customerDao.findLostByPage(pageNo, pageSize);
	}
	
	public Customer load(Long id){
		return customerDao.load(id);
	}
	
}
