package crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import crm.dao.DataDao;
import crm.model.DataLibrary;

@Component
public class DataService {

	@Autowired private DataDao dataDao;
	
	public void save(DataLibrary data){
		this.dataDao.save(data);
	}
	
	public List<DataLibrary> findAll(){
		return this.dataDao.findAll();
	}
	public List<DataLibrary> findByCriteria(String dataType, String dataName, String dataValue, int pageNo,int pageSize){
		return dataDao.findByCriteria(dataType, dataName, dataValue, pageNo, pageSize);
	}
	public DataLibrary findDataById(Long id){
		return this.dataDao.findDataById(id);
	}
	
	public void delete(Long id){
		this.dataDao.delete(id);
	}
	
	public List<String> findAllType(){
		return dataDao.findAllType();
	}
	
	public DataLibrary getDataLibrary(Long id){
		return this.dataDao.getDataLibrary(id);
	}
	
	public List<DataLibrary> findByPage(int pageNo, int pageSize){
		return dataDao.findByPage(pageNo, pageSize);
	}
	
	public int countAll(){
		return dataDao.countAll();
	}
	public int countByCriteria(String dataType, String dataName, String dataValue){
		return dataDao.countByCriteria(dataType, dataName, dataValue);
	}
}
