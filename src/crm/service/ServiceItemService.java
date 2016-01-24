package crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import crm.dao.ServiceItemDao;
import crm.model.ServiceItem;
import crm.model.ServiceType;

@Component
public class ServiceItemService {
	@Autowired private ServiceItemDao serviceItemDao;
	
	public List<ServiceItem> findAll(){
		return serviceItemDao.findAll();
	}
	
	public void save(ServiceItem serviceItem){
		serviceItemDao.save(serviceItem);
	}
	
	public ServiceItem load(Long id){
		return serviceItemDao.load(id);
	}
	
	public int countAll(){
		return serviceItemDao.countAll();
	}
	
	public int countByType(ServiceType serviceType){
		return serviceItemDao.countByType(serviceType);
	}
	
	public int countAllAndFB(){
		return serviceItemDao.countAllAndFB();
	}
	
	public List<ServiceItem> findByPage(int pageNo,int pageSize){
		return serviceItemDao.findByPage(pageNo, pageSize);
	}
	
	public int countAllAndRes(String sCusName,String sSum,String sType,String st,String et){
		return serviceItemDao.countAllAndRes(sCusName, sSum, sType, st, et);
	}
	
	public List<ServiceItem> findByPageAndRes(int pageNo,int pageSize,String sCusName,String sSum,String sType,String st,String et){
		return serviceItemDao.findByPageAndRes( pageNo,pageSize, sCusName, sSum, sType, st, et);
	}
	
	public void delete(Long id){
		serviceItemDao.delete(id);
	}
	
}
