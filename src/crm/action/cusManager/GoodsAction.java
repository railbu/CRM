package crm.action.cusManager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import crm.model.Goods;
import crm.service.GoodsService;


public class GoodsAction extends ActionSupport implements Preparable,ModelDriven<Goods>{

	private static final long serialVersionUID = 1L;
	
	@Autowired private GoodsService goodsService;

	private Goods goods;
	private String goodsName;
	private String goodsType;
	private String goodsLevel;
	
	private List<Goods> list;
	
	//分页
	private List<Integer> pages = new ArrayList<Integer>();
	private int currentPage = 1;
	private int pageCount;
	private int lastPage;
	private int nextPage;
	private int pageSize = 10;
	
	public String list() {

		try{
			int count = goodsService.countAll();
			setPageCount(count/getPageSize()+(count%getPageSize()==0?0:1));
			
			//设置leftPage 和 nextPage
			setLastPage(getCurrentPage() == 1?1:getCurrentPage()-1);
			setNextPage(getCurrentPage() == getPageCount()?getCurrentPage():getCurrentPage()+1);
			
			
			System.out.println("pageCount="+getPageCount());
			for(int i=1;i<=getPageCount();i++){
				getPages().add(i);
			}
				
			list =  goodsService.findByPage((getCurrentPage()-1)*getPageSize(), getPageSize());
			return "list";
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		return "list";
	}
	
	public String searchlist() {
		
		try{
			
			int count = goodsService.countByCriteria(goodsName, goodsType, goodsLevel);
			setPageCount(count/getPageSize()+(count%getPageSize()==0?0:1));
			
			//设置leftPage 和 nextPage
			setLastPage(getCurrentPage() == 1?1:getCurrentPage()-1);
			setNextPage(getCurrentPage() == getPageCount()?getCurrentPage():getCurrentPage()+1);
			
			
			System.out.println("pageCount="+getPageCount());
			for(int i=1;i<=getPageCount();i++){
				getPages().add(i);
			}
				
			list =  goodsService.findByCriteria(goodsName, goodsType, goodsLevel, (getCurrentPage()-1)*getPageSize(), getPageSize());
			return "list";
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		return "list";
	}
	
	
	@Override
	public Goods getModel() {
		return this.goods;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public String getGoodsName() {
		return goodsName;
	}


	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}


	public String getGoodsType() {
		return goodsType;
	}


	public void setGoodsType(String goodsType) {
		this.goodsType = goodsType;
	}


	public String getGoodsLevel() {
		return goodsLevel;
	}


	public void setGoodsLevel(String goodsLevel) {
		this.goodsLevel = goodsLevel;
	}


	public List<Goods> getList() {
		return list;
	}

	public void setList(List<Goods> list) {
		this.list = list;
	}


	@Override
	public void prepare() throws Exception {

		this.goods = new Goods();
		
	}


	public int getLastPage() {
		return lastPage;
	}


	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}


	public int getNextPage() {
		return nextPage;
	}


	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}


	public List<Integer> getPages() {
		return pages;
	}


	public void setPages(List<Integer> pages) {
		this.pages = pages;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getPageCount() {
		return pageCount;
	}


	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	
}
