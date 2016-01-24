package crm.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Component;

import crm.model.SaleOpportunity;
import crm.model.User;

@Component
public class OpportunityDao extends HibernateDaoSupport{
	public SaleOpportunity save(SaleOpportunity SaleOpportunity){
		System.out.println("Customer name:"+SaleOpportunity.getId());
		System.out.println("user:"+SaleOpportunity.getCreatePerson().getId());
		super.getSession().saveOrUpdate(SaleOpportunity);
		return SaleOpportunity;
	}
	@SuppressWarnings("unchecked")
	public List<SaleOpportunity> findAll(){
		return super.getSession()
				.createCriteria(SaleOpportunity.class)
				.addOrder(Order.asc("id")).list();
	}
	public SaleOpportunity findOpportunityById(Long id){
		Session session = super.getSession();
		
		SaleOpportunity opportunity = (SaleOpportunity) session.createCriteria(SaleOpportunity.class)
				.add(Restrictions.eq("id", id)).uniqueResult();
		
		return opportunity;
	}
	
	public void delete(Long id){
		super.getSession().delete(super.getSession().load(SaleOpportunity.class, id));
	}
	
	public SaleOpportunity getSaleOpportunity(Long id) {
		return (SaleOpportunity) super.getSession().get(SaleOpportunity.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<SaleOpportunity> findByPage(int pageNo,int pageSize){
		Session session = super.getSession();
		return session.createCriteria(SaleOpportunity.class)
			.setFirstResult(pageNo)
			.setMaxResults(pageSize)
			.addOrder(Order.asc("id"))
			.list();
		
	}
	
	@SuppressWarnings("unchecked")
	public List<SaleOpportunity> findByState(int pageNo,int pageSize){
		Session session = super.getSession();
		return session.createCriteria(SaleOpportunity.class)
				.add(Restrictions.eq("assignState", "已指派"))
			.setFirstResult(pageNo)
			.setMaxResults(pageSize)
			.addOrder(Order.asc("id"))
			.list();
		
	}
	
	@SuppressWarnings("unchecked")
	public List<SaleOpportunity> findByPerson(int pageNo,int pageSize, User user){
		Session session = super.getSession();
		return session.createCriteria(SaleOpportunity.class)
				.add(Restrictions.eq("createPerson", user))
			.setFirstResult(pageNo)
			.setMaxResults(pageSize)
			.addOrder(Order.asc("id"))
			.list();
		
	}
	
	@SuppressWarnings("unchecked")
	public List<SaleOpportunity> findByCriteria(String cusName, String sum, String contName, int pageNo,int pageSize, String state){
		String hql = "from SaleOpportunity opt where opt.customerName like'%"+cusName+"%' and opt.summary like'%"
				+sum+"%' and opt.contactName like'%"+contName+"%'";
		if(state != null)
			hql += "and assignState = '已指派'";
		Session session = super.getSession();
		return session.createQuery(hql).setFirstResult(pageNo).setMaxResults(pageSize).list();
	}
	@SuppressWarnings("unchecked")
	public List<SaleOpportunity> findByCusCriteria(String cusName, String sum, String contName, int pageNo,int pageSize, User user,String state){
		String hql = "from SaleOpportunity opt where opt.customerName like'%"+cusName+"%' "
						+ "and opt.summary like'%"+sum+"%' "
						+ "and opt.contactName like'%"+contName+"%' "
						;
		
		if(state != null)
			hql += "and assignState = '已指派' and opt.assignPerson = ?";
		else
			hql += "and opt.createPerson=?";
	
		Session session = super.getSession();
		return session.createQuery(hql)
				.setParameter(0, user)
				.setFirstResult(pageNo).setMaxResults(pageSize).list();
	}
	
	//查询总条数
	public int countAll(){
		String hql = "select count(*) from SaleOpportunity";
		Session session = super.getSession();
		return ((Long)session.createQuery(hql).uniqueResult()).intValue();
	}

	public int countByCriteria(String cusName, String sum, String contName, String state){
		String hql = "select count(*) from SaleOpportunity opt where opt.customerName like'%"+cusName
				+"%' and opt.summary like'%"+sum+"%' and opt.contactName like'%"+contName+"%'";
		if(state != null)
			hql += "and assignState = '已指派'";
		Session session = super.getSession();
		return ((Long)session.createQuery(hql).uniqueResult()).intValue();
	}
	
	public int countByCusCriteria(String cusName, String sum, String contName, User user, String state){
		String hql = "select count(*) from SaleOpportunity opt where opt.customerName like'%"
				+cusName+"%' and opt.summary like'%"+sum+"%' and opt.contactName like'%"
				+contName+"%'";
		if(state != null)
			hql += "and assignState = '已指派' and opt.createPerson=?";
		else
			hql += "and opt.createPerson=?";
		Session session = super.getSession();
		return ((Long)session.createQuery(hql)
				.setParameter(0, user)
				.uniqueResult()).intValue();
	}
	
	//根据创建人
	public int countByPerson(User user){
		String hql = "select count(*) from SaleOpportunity where createPerson = ?";
		Session session = super.getSession();
		return ((Long)session.createQuery(hql)
				.setParameter(0, user)
				.uniqueResult()).intValue();
	}
	
	//查询总条数
	public int countAllByState(){
			String hql = "select count(*) from SaleOpportunity where assignState = '已指派'";
			Session session = super.getSession();
			return ((Long)session.createQuery(hql).uniqueResult()).intValue();
	}
}
