package crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import crm.dao.LeftGoodsDao;
import crm.model.LeftGoods;


@Component
public class LeftGoodsService {

	@Autowired private LeftGoodsDao leftGoodsDao;
	
	public List<LeftGoods> findAll() {
		return this.leftGoodsDao.findAll();
	}
	
	public int countAll(){
		return leftGoodsDao.countAll();
	}
	
	public List<LeftGoods> findByPage(int pageNo,int pageSize){
		return this.leftGoodsDao.findByPage(pageNo, pageSize);
	}
	
	public List<LeftGoods> findByCriteria(String productName, String respoitoryName,  int pageNo,int pageSize){
		return this.leftGoodsDao.findByCriteria(productName, respoitoryName, pageNo, pageSize);
	}
	
	public int countByCriteria(String productName, String respoitoryName){
		return this.leftGoodsDao.countByCriteria(productName, respoitoryName);
	}
}
