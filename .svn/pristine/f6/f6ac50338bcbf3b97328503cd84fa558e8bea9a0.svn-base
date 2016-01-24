package crm.action.cusManager;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import crm.model.Customer;
import crm.model.Measure;
import crm.service.CustomerService;
import crm.service.MeasureService;

@Controller
@Scope("request")
public class MeasureAction extends ActionSupport implements ModelDriven<Customer>{

	private static final long serialVersionUID = 1L;

	@Autowired MeasureService measureService;
	@Autowired CustomerService customerService;
	private String content;
	private Measure measure;
	private Customer customer;
	private Long cnbid;
	private List<Customer> list;
	private List<Measure> measurelist;
	private String reasonOfLost;
	
	private String query_cus = "";
	private String query_user = "";
	private String query_state = "";
	
	//分页
	private List<Integer> pages = new ArrayList<Integer>();
	private int currentPage = 1;
	private int pageCount;
	private int lastPage;
	private int nextPage;
	private int pageSize = 10;
		
	public String list(){
		
		int tcyujing = measureService.countAllByRes(query_cus, query_user, "预警");
		ActionContext.getContext().getSession().put("liushi", tcyujing);
		//控制上方的图标提示 是否进行闪动
		ActionContext.getContext().getSession().put("liushiyikan", "yes");
		
		//ArrayList<Customer> t = new ArrayList(this.measureService.list("", "", "" ));
		if(this.query_state.equals("1"))
			query_state = "暂缓流失";
		else if(this.query_state.equals("2"))
			query_state = "确认流失";
		else
			query_state = "";
		
		int count = measureService.countAllByRes(query_cus, query_user, query_state);
		pageCount = count/pageSize+(count%pageSize==0?0:1);
		
		//设置leftPage 和 nextPage
		lastPage = currentPage == 1?1:currentPage-1;
		nextPage = currentPage == pageCount?currentPage:currentPage+1;
		
		for(int i=1;i<=pageCount;i++){
			pages.add(i);
		}
		list = new ArrayList<Customer>(this.measureService.list((currentPage-1)*pageSize,pageSize,query_cus, query_user, query_state));
		
		return "list";
	}
	
	public boolean saveValidation() {
		if (StringUtils.isEmpty(content)){
			super.addFieldError("name", "暂缓措施不能为空");
			return false;
		}
		return true;
	}
	
	public boolean saveValidation1() {
		if (StringUtils.isEmpty(reasonOfLost)){
			super.addFieldError("name", "流失原因不能为空");
			return false;
		}
		return true;
	}
	
	public String edit(){
		this.customer = this.customerService.getCustomer(cnbid);
		setMeasurelist(new ArrayList<Measure>(this.customer.getMeasures()));
		return "edit";
	}
	
	public String editMeasure(){
		if(!saveValidation())
			return edit();
		try{
			this.customer = this.customerService.getCustomer(this.cnbid);
			System.out.println("customer:"+this.customer.getId());
			this.measure = new Measure();
			this.measure.setContent(content);
			this.customer.addMeasure(measure);
			this.customer.setState("暂缓流失");
			this.customer.setReasonOfLost(null);
			this.customerService.save(customer);
		}catch (Exception e){
			e.printStackTrace();
		}
		return list();
	}
	
	public String confirm(){
		this.customer = this.customerService.getCustomer(cnbid);
		setMeasurelist(new ArrayList<Measure>(this.customer.getMeasures()));
		return "confirm";
	}
	
	public String confirmMeasure() {
		if(!saveValidation1())
			return confirm();
		this.customer = this.customerService.getCustomer(this.cnbid);
		this.customer.setReasonOfLost(reasonOfLost);
		this.customer.setState("确认流失");
		Date date = new Date();
		this.customer.setTimeOfLost(date);
		this.customerService.save(customer);
		return list();
	}

	public List<Customer> getList() {
		return list;
	}

	public void setList(List<Customer> list) {
		this.list = list;
	}

	public long getCnbid() {
		return cnbid;
	}

	public void setCnbid(long cnbid) {
		this.cnbid = cnbid;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

//	private void prepareModel(){
//		if(this.cnbid != null)
//			this.customer = this.customerService.getCustomer(cnbid);
//		else
//			this.customer = new Customer();
//	}
	
	@Override
	public Customer getModel() {
		// TODO Auto-generated method stub
		return this.customer;
	}

//	@Override
//	public void prepare() throws Exception {
//		prepareModel();	
//	}

	public List<Measure> getMeasurelist() {
		return measurelist;
	}

	public void setMeasurelist(List<Measure> measurelist) {
		this.measurelist = measurelist;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public Measure getMeasure() {
		return measure;
	}

	public void setMeasure(Measure measure) {
		this.measure = measure;
	}

	
	public String getReasonOfLost() {
		return reasonOfLost;
	}

	public void setReasonOfLost(String reasonOfLost) {
		this.reasonOfLost = reasonOfLost;
	}

	public String getQuery_cus() {
		return query_cus;
	}

	public void setQuery_cus(String query_cus) {
		this.query_cus = query_cus;
	}

	public String getQuery_user() {
		return query_user;
	}

	public void setQuery_user(String query_user) {
		this.query_user = query_user;
	}

	public String getQuery_state() {
		return query_state;
	}

	public void setQuery_state(String query_state) {
		this.query_state = query_state;
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
