package crm.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Component;

import crm.model.Customer;

@Component
public class MeasureDao extends HibernateDaoSupport {

	
	@SuppressWarnings("unchecked")
	public int countAllByRes(String query_cus, String query_user, String query_state){
		Session session = super.getSession(); 
		
		Criteria c;
		try {
			c = session.createCriteria(Customer.class);
			//c.setFetchMode("user", org.hibernate.FetchMode.JOIN);
			if(!"".equals(query_cus))
				c.add(Restrictions.like("name", "%"+query_cus+"%"));
			if(!"".equals(query_state))
			{
				c.add(Restrictions.like("state", "%"+query_state+"%"));
				System.out.println("ssss="+query_state);
			}
			if(!"".equals(query_user))
				c.add(Restrictions.like("u.name", "%"+query_user+"%"));
			
			System.out.println("size:"+c.list().size());
			List<Customer> clist = c.list();
			List<Customer> res = new ArrayList<Customer>();
			
			Date now = new Date();
			Long nowS = now.getTime();
			
			for(int i=0;i<clist.size();i++){
				Customer tc = clist.get(i);
				Date ls = null;				
				if(!StringUtils.isEmpty(tc.getLastShoppingTime())){
					try {
						ls = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(tc.getLastShoppingTime());
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					Long cha = 1000L*60L*60L*24L*30L*6L;
					if(nowS - ls.getTime() > cha){
						res.add(tc);
					}
				}
			}
			return res.size();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//return session.createCriteria(Customer.class).list();
		return 0;
	}
	
	@SuppressWarnings("unchecked")
	public List<Customer> list(int pageNo,int pageSize,String query_cus, String query_user, String query_state) {	
		Session session = super.getSession(); 
		
		Criteria c;
		try {
			
			//c = session.createCriteria(Customer.class, "c").createAlias("user", "u");
			c = session.createCriteria(Customer.class);
			//c.setFetchMode("user", org.hibernate.FetchMode.JOIN);
			if(!"".equals(query_cus))
				c.add(Restrictions.like("name", "%"+query_cus+"%"));
			if(!"".equals(query_state))
				c.add(Restrictions.like("state", "%"+query_state+"%"));
			if(!"".equals(query_user))
				c.add(Restrictions.like("u.name", "%"+query_user+"%"));

			System.out.println("size:"+c.list().size());
			List<Customer> clist = c.list();
			List<Customer> res = new ArrayList<Customer>();
			
			Date now = new Date();
			Long nowS = now.getTime();
			
			for(int i=0;i<clist.size();i++){
				Customer tc = clist.get(i);
				Date ls = null;
//				System.out.println(tc.getName()+tc.getLastShoppingTime());
				if(!StringUtils.isEmpty(tc.getLastShoppingTime())){
					try {
						ls = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(tc.getLastShoppingTime());
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					Long cha = 1000L*60L*60L*24L*30L*6L;
					if(nowS - ls.getTime() > cha){
						res.add(tc);
					}
				}
			}
			return res;
			
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//return session.createCriteria(Customer.class).list();
		return null;
	}
}
