package crm.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Component;

import crm.model.Goods;

@Component
public class GoodsDao extends HibernateDaoSupport{

	@SuppressWarnings("unchecked")
	public List<Goods> findAll() {
		return super.getSession()
				.createCriteria(Goods.class)
				.addOrder(Order.asc("id")).list();
	}
	
	public int countAll(){
		String hql = "select count(*) from Goods";
		Session session = super.getSession();
		return ((Long)session.createQuery(hql).uniqueResult()).intValue();
	}
	
	@SuppressWarnings("unchecked")
	public List<Goods> findByCriteria(String goodsName, String goodsType, String goodsLevel, int pageNo,int pageSize){
		String hql = "from Goods g where g.name like'%"+goodsName+"%' and g.type like'%"+goodsType+"%' and g.level like'%"+goodsLevel+"%'";
		Session session = super.getSession();
		return session.createQuery(hql).setFirstResult(pageNo).setMaxResults(pageSize).list();
	}

	public int countByCriteria(String goodsName, String goodsType, String goodsLevel){
		String hql = "select count(*) from Goods g where g.name like'%"+goodsName+"%' and g.type like'%"+goodsType+"%' and g.level like'%"+goodsLevel+"%'";
		Session session = super.getSession();
		return ((Long)session.createQuery(hql).uniqueResult()).intValue();
	}
	
	@SuppressWarnings("unchecked")
	public List<Goods> findByPage(int pageNo,int pageSize){
		Session session = super.getSession();
		return session.createCriteria(Goods.class)
			.setFirstResult(pageNo)
			.setMaxResults(pageSize)
			.list();
		
	}
}
