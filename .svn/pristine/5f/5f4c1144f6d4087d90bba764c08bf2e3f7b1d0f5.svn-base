package crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import crm.dao.GoodsDao;
import crm.model.Goods;


@Component
public class GoodsService {

	@Autowired private GoodsDao goodsDao;
	
	public List<Goods> findAll() {
		return this.goodsDao.findAll();
	}
	
	public int countAll(){
		return goodsDao.countAll();
	}
	
	public List<Goods> findByPage(int pageNo,int pageSize){
		return this.goodsDao.findByPage(pageNo, pageSize);
	}
	
	public List<Goods> findByCriteria(String goodsName, String goodsType, String goodsLevel, int pageNo,int pageSize){
		return this.goodsDao.findByCriteria(goodsName, goodsType, goodsLevel, pageNo, pageSize);
	}
	
	public int countByCriteria(String goodsName, String goodsType, String goodsLevel){
		return this.goodsDao.countByCriteria(goodsName, goodsType, goodsLevel);
	}
}
