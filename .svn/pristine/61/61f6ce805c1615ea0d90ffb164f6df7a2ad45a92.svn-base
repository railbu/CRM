package crm.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Component;

import crm.model.User;
import crm.model.UserAuthority;

@Component
public class UserAuthorityDao extends HibernateDaoSupport{
	
	public UserAuthority findUA(int power,String methodName){
		String hql = "from UserAuthority where power = ? and "
				+ "authority.methodName = ?";
		UserAuthority ua;
		Session session = super.getSession();
//		ua = (UserAuthority) session.createCriteria(UserAuthority.class)
//				.add(Restrictions.eq("user.username",username))
//				.add(Restrictions.eq("authority.methodName", methodName))
//				.uniqueResult();
		ua = (UserAuthority) session.createQuery(hql)
				.setInteger(0, power)
				.setString(1, methodName)
				.uniqueResult();
		return ua;
	}
	
	@SuppressWarnings("unchecked")
	public List<UserAuthority> findAllByPower(int power){
		Session session = super.getSession();
		return session.createCriteria(UserAuthority.class)
				.add(Restrictions.eq("power",power))
				.list();
	}
	
	public void save(UserAuthority ua){
		Session session = super.getSession();
		session.saveOrUpdate(ua);
	}
}
