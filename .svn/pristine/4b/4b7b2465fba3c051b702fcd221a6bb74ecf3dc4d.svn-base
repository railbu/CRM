package crm.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Component;

import crm.model.LeftGoods;

@Component
public class LeftGoodsDao extends HibernateDaoSupport{

	@SuppressWarnings("unchecked")
	public List<LeftGoods> findAll() {
		return super.getSession()
				.createCriteria(LeftGoods.class)
				.addOrder(Order.asc("id")).list();
	}
	
	public int countAll(){
		String hql = "select count(*) from LeftGoods";
		Session session = super.getSession();
		return ((Long)session.createQuery(hql).uniqueResult()).intValue();
	}
	
	@SuppressWarnings("unchecked")
	public List<LeftGoods> findByPage(int pageNo,int pageSize){
		Session session = super.getSession();
		return session.createCriteria(LeftGoods.class)
			.setFirstResult(pageNo)
			.setMaxResults(pageSize)
			.list();
		
	}
	
	@SuppressWarnings("unchecked")
	public List<LeftGoods> findByCriteria(String productName, String respoitoryName, int pageNo,int pageSize){
		String hql = "from LeftGoods g where g.goods.name like'%"+productName+"%' and g.respoitory like'%"+respoitoryName+"%'";
		Session session = super.getSession();
		return session.createQuery(hql).setFirstResult(pageNo).setMaxResults(pageSize).list();
	}

	public int countByCriteria(String productName, String respoitoryName){
		String hql = "select count(*) from LeftGoods g where g.goods.name like'%"+productName+"%' and g.respoitory like'%"+respoitoryName+"%'";
		Session session = super.getSession();
		return ((Long)session.createQuery(hql).uniqueResult()).intValue();
	}
}
