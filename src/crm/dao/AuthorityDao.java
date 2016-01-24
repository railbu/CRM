package crm.dao;

import java.util.List;

import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Component;

import crm.model.Authority;

@Component
public class AuthorityDao extends HibernateDaoSupport{
	
	@SuppressWarnings("unchecked")
	public List<Authority> findAll(){
		Session session = super.getSession();
		return session.createCriteria(Authority.class).list();
	}
}
