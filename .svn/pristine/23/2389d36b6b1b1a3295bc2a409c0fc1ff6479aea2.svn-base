package crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import crm.dao.DevPlanDao;
import crm.model.CusDevPlan;
import crm.model.SaleOpportunity;
@Component
public class DevPlanService {

	@Autowired private DevPlanDao devplanDao;
	
	public List<CusDevPlan> findPlanByOpt(SaleOpportunity planopt){
		return this.devplanDao.findPlanByOpt(planopt);
	}
	
	public void save(CusDevPlan plan){
		this.devplanDao.save(plan);
	}
	
	public CusDevPlan findPlanById(Long id){
		return this.devplanDao.findPlanById(id);
	}
	
	public CusDevPlan getCusDevPlan(Long id){
		return this.devplanDao.getCusDevPlan(id);
	}
	
	public void delete(Long id){
		this.devplanDao.delete(id);
	}
}
