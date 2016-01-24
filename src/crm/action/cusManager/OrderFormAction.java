package crm.action.cusManager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import crm.model.Customer;
import crm.model.OrderForm;
import crm.model.OrderGoods;
import crm.service.CustomerService;
import crm.service.OrderFormService;


@Controller
@Scope("request")
public class OrderFormAction extends ActionSupport implements Preparable,ModelDriven<OrderForm>{

	private static final long serialVersionUID = 1L;
	
	@Autowired private OrderFormService orderFormService;
	@Autowired private CustomerService customerService;
	private Long id;
	private Customer customer;
	private OrderForm orderForm;
	private List<OrderForm> list;
	private List<OrderGoods> goodsList;
	private Long cnid;
	private Long myid;
	
	//分页
	private List<Integer> pages = new ArrayList<Integer>();
	private int currentPage = 1;
	private int pageCount;
	private int lastPage;
	private int nextPage;
	private int pageSize = 10;
	
	public String list() {
		try{
			this.customer = this.customerService.findCustomerById(this.myid);
			ActionContext.getContext().put("customer", this.customer);
			this.list = new ArrayList<OrderForm>(this.customer.getOrderForms());
			int count = this.list.size();
			pageCount = count/pageSize+(count%pageSize==0?0:1);
			
			//设置leftPage 和 nextPage
			lastPage = currentPage == 1?1:currentPage-1;
			nextPage = currentPage == pageCount?currentPage:currentPage+1;
			
			for(int i=1;i<=pageCount;i++){
				pages.add(i);
			}
			
			if((currentPage-1)*pageSize+pageSize >= this.list.size())
			{
				this.list = this.list
						.subList((currentPage-1)*pageSize, this.list.size());
			} else {
				this.list = this.list
						.subList((currentPage-1)*pageSize, (currentPage-1)*pageSize+pageSize);
			}
			
			
		}catch (Exception e){
			e.printStackTrace();
		}
		return "list";
	}
	
	public String moreinfo() {
		try{
			this.customer = this.customerService.findCustomerById(this.myid);
			this.orderForm = this.orderFormService.loadOrderForm(this.cnid);
			System.out.println("name:"+this.customer.getName()+"orderForm:"+this.orderForm.getOrderNum());
			ActionContext.getContext().put("orderForm", this.orderForm);
			this.goodsList = new ArrayList<OrderGoods>(this.orderForm.getOrderGoods());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "moreinfo";
	}
	
	@Override
	public OrderForm getModel() {
		return this.orderForm;
	}

	@Override
	public void prepare() throws Exception {
		this.orderForm = new OrderForm();
	}

	public OrderForm getOrderForm() {
		return orderForm;
	}

	public void setOrderForm(OrderForm orderForm) {
		this.orderForm = orderForm;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<OrderForm> getList() {
		return list;
	}

	public void setList(List<OrderForm> list) {
		this.list = list;
	}

	public Long getMyid() {
		return myid;
	}

	public void setMyid(Long myid) {
		this.myid = myid;
	}
	
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	

	public List<OrderGoods> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<OrderGoods> goodsList) {
		this.goodsList = goodsList;
	}

	public Long getCnid() {
		return cnid;
	}

	public void setCnid(Long cnid) {
		this.cnid = cnid;
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

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	

}
