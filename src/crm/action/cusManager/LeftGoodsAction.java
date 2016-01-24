package crm.action.cusManager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import crm.model.LeftGoods;
import crm.service.LeftGoodsService;


public class LeftGoodsAction extends ActionSupport implements Preparable,ModelDriven<LeftGoods>{

	private static final long serialVersionUID = 1L;
	
	@Autowired private LeftGoodsService leftGoodsService;

	private LeftGoods leftGoods;
	private String productName;
	private String respoitoryName;
	
	private List<LeftGoods> list;
	
	//分页
	private List<Integer> pages = new ArrayList<Integer>();
	private int currentPage = 1;
	private int pageCount;
	private int lastPage;
	private int nextPage;
	private int pageSize = 10;
	
	public String list() {
		
		try{
			int count = leftGoodsService.countAll();
			setPageCount(count/getPageSize()+(count%getPageSize()==0?0:1));
			
			//设置leftPage 和 nextPage
			setLastPage(getCurrentPage() == 1?1:getCurrentPage()-1);
			setNextPage(getCurrentPage() == getPageCount()?getCurrentPage():getCurrentPage()+1);
			
			
			System.out.println("pageCount="+getPageCount());
			for(int i=1;i<=getPageCount();i++){
				getPages().add(i);
			}
				
			list =  leftGoodsService.findByPage((getCurrentPage()-1)*getPageSize(), getPageSize());
			return "list";
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		return "list";
	}
	
	public String searchlist() {
		
		try{
			
			int count = leftGoodsService.countByCriteria(productName, respoitoryName);
			setPageCount(count/getPageSize()+(count%getPageSize()==0?0:1));
			
			//设置leftPage 和 nextPage
			setLastPage(getCurrentPage() == 1?1:getCurrentPage()-1);
			setNextPage(getCurrentPage() == getPageCount()?getCurrentPage():getCurrentPage()+1);
			
			
			System.out.println("pageCount="+getPageCount());
			for(int i=1;i<=getPageCount();i++){
				getPages().add(i);
			}
				
			list =  leftGoodsService.findByCriteria(productName, respoitoryName, (getCurrentPage()-1)*getPageSize(), getPageSize());
			return "list";
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		return "list";
	}
	
	
	@Override
	public LeftGoods getModel() {
		return this.leftGoods;
	}

	public LeftGoods getGoods() {
		return leftGoods;
	}

	public void setLeftGoods(LeftGoods leftGoods) {
		this.leftGoods = leftGoods;
	}
	
	public List<LeftGoods> getList() {
		return list;
	}

	public void setList(List<LeftGoods> list) {
		this.list = list;
	}


	@Override
	public void prepare() throws Exception {

		this.leftGoods = new LeftGoods();
		
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


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public String getRespoitoryName() {
		return respoitoryName;
	}


	public void setRespoitoryName(String respoitoryName) {
		this.respoitoryName = respoitoryName;
	}

	
}
