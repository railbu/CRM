package crm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import crm.dao.OrderFormDao;
import crm.model.OrderForm;

@Component
public class OrderFormService {
	@Autowired private OrderFormDao orderFormDao;
	
	public OrderForm loadOrderForm(Long id){
		return this.orderFormDao.loadOrderForm(id);
	}
}
