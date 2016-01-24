package crm.dao;


import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Component;

import crm.model.OrderForm;

@Component
public class OrderFormDao extends HibernateDaoSupport {
	
	public OrderForm loadOrderForm(Long id){
		return (OrderForm) super.getSession().load(OrderForm.class,id);
	}

}
