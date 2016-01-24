package crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import crm.dao.OpportunityDao;
import crm.model.SaleOpportunity;
import crm.model.User;

@Component
public class OpportunityService {
	@Autowired private OpportunityDao opportunityDao;
	
	public void save(SaleOpportunity SaleOpportunity){
		this.opportunityDao.save(SaleOpportunity);
	}
	public List<SaleOpportunity> findAll(){
		return this.opportunityDao.findAll();
	}
	public List<SaleOpportunity> findByCriteria(String cusName, String description, String contName,int pageNo,int pageSize, String state){
		return opportunityDao.findByCriteria(cusName, description, contName, pageNo, pageSize, state);
	}
	public List<SaleOpportunity> findByCusCriteria(String cusName, String description, String contName,int pageNo,int pageSize,User user,String state){
		return opportunityDao.findByCusCriteria(cusName, description, contName, pageNo, pageSize,user,state);
	}
	public SaleOpportunity findOpportunityById(Long id){
		return this.opportunityDao.findOpportunityById(id);
	}
	public void delete(Long id){
		this.opportunityDao.delete(id);
	}
	
	public SaleOpportunity getSaleOpportunity(Long id) {
		return this.opportunityDao.getSaleOpportunity(id);
	}
	
	public List<SaleOpportunity> findByPage(int pageNo,int pageSize){
		return opportunityDao.findByPage(pageNo, pageSize);
	}
	public List<SaleOpportunity> findByState(int pageNo,int pageSize){
		return opportunityDao.findByState(pageNo, pageSize);
	}
	public List<SaleOpportunity> findByPerson(int pageNo,int pageSize,User user){
		return opportunityDao.findByPerson(pageNo, pageSize,user);
	}
	public int countAll(){
		return opportunityDao.countAll();
	}
	public int countByCriteria(String cusName, String description, String contName, String state){
		return opportunityDao.countByCriteria(cusName, description, contName, state);
	}
	public int countByCusCriteria(String cusName, String description, String contName,User user, String state){
		return opportunityDao.countByCusCriteria(cusName, description, contName,user,state);
	}
	public int countAllByState(){
		return opportunityDao.countAllByState();
	}
	public int countAllByPerson(User user){
		return opportunityDao.countByPerson(user);
	}
}
