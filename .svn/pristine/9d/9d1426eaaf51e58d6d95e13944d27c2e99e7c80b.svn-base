package crm.dao;

import java.util.List;

import crm.model.User;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Component;

import crm.dao.support.HibernateUtil;

@Component
public class UserDao extends HibernateDaoSupport{
	
	public User findUser(String username){
		Session session = super.getSession();
		User user = (User) session.createCriteria(User.class)
				.add(Restrictions.eq("username", username)).uniqueResult();
		return user;
	}
	
	public int countAll(){
		String hql="select count(*) from User";
		Session session = super.getSession();
		return ((Long)session.createQuery(hql).uniqueResult()).intValue();
	}
	
	@SuppressWarnings("unchecked")
	public List<User> findAllByType(int type){
		Session session = super.getSession();
		List<User> users;
		users = session.createCriteria(User.class).add(Restrictions.eq("power",type)).list();
		return users;
	}
	
	@SuppressWarnings("unchecked")
	public List<User> findAll(){
		Session session = super.getSession();
		List<User> users;
		users = session.createCriteria(User.class).list();
		return users;
	}
	
	@SuppressWarnings("unchecked")
	public List<User> findAllByPage(int pageNo,int pageSize){
		Session session = super.getSession();
		return session.createCriteria(User.class)
			.setFirstResult(pageNo)
			.setMaxResults(pageSize)
			.list();
				
	}
	
	public User save(User user){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();
		}catch(Exception e){
			session.getTransaction().rollback();
		}
		
		return user;
	}
	
	public User loadUser(Long userId){
		return (User) super.getSession().load(User.class, userId);
	}
}
