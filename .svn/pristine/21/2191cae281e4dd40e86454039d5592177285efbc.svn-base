package crm.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Component;

import crm.model.CusDevPlan;
import crm.model.SaleOpportunity;
@Component
public class DevPlanDao extends HibernateDaoSupport {

	@SuppressWarnings("unchecked")
	public List<CusDevPlan> findPlanByOpt(SaleOpportunity planopt){
		return super.getSession().createCriteria(CusDevPlan.class)
				.add(Restrictions.eq("saleOpp", planopt)).addOrder(Order.asc("createTime")).list();
	}
	
	public CusDevPlan findPlanById(Long id){
		Session session = super.getSession();
		
		CusDevPlan plan = (CusDevPlan)session.createCriteria(CusDevPlan.class)
				.add(Restrictions.eq("id", id)).uniqueResult();
		
		return plan;
	}
	
	public CusDevPlan save(CusDevPlan plan){
		System.out.println("save plan");
		super.getSession().saveOrUpdate(plan);
		return plan;
	}
	
	public CusDevPlan getCusDevPlan(Long id){
		return (CusDevPlan)super.getSession().get(CusDevPlan.class, id);
	}
	
	public void delete(Long id){
		super.getSession().delete(super.getSession().load(CusDevPlan.class, id));
	}
}
