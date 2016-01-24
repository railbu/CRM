package crm.action.cusManager;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import crm.model.Customer;
import crm.model.OrderForm;
import crm.model.Rank;
import crm.model.ServiceType;
import crm.service.CustomerService;
import crm.service.ServiceItemService;

@Controller
@Scope("request")
public class AnalysizeAction extends ActionSupport implements Preparable,ModelDriven<Customer>{

	private static final long serialVersionUID = 1L;
	
	@Autowired private CustomerService customerService;
	@Autowired private ServiceItemService serviceItemService;
	
	private Customer customer;
	private List<Customer> clist;
	private List<Customer> cslist;
	private Long customerId;
	private String year;
	private Rank[] ranks = Rank.values();
	private List<String[]> list = new ArrayList<String[]>();
	private List<OrderForm> oflist;
	private String check;
	private Integer[] priceCount;
	private ServiceType[] types = ServiceType.values();
	private String[] s;
	private String[] ss;
	private String[] color = {"#00FF66","#CC66FF","#FFFF66","#00CCFF","#FF0066"};
	private String[] highlight = {"#00FF00","#CC00FF","#FFFF00","#0066FF","#FF0000"};
	
	//分页
	private List<Integer> pages = new ArrayList<Integer>();
	private int currentPage = 1;
	private int pageCount;
	private int lastPage;
	private int nextPage;
	private int pageSize = 3;
	
	public String lostlist() {
		try{
			int count = customerService.countAllLost();
			setPageCount(count/getPageSize()+(count%getPageSize()==0?0:1));
			
			//设置leftPage 和 nextPage
			setLastPage(getCurrentPage() == 1?1:getCurrentPage()-1);
			setNextPage(getCurrentPage() == getPageCount()?getCurrentPage():getCurrentPage()+1);
			
			for(int i=1;i<=getPageCount();i++){
				getPages().add(i);
			}
				
			clist =  customerService.findLostByPage((getCurrentPage()-1)*getPageSize(), getPageSize());
			return "lostlist";
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		return "lostlist";
	}
	
	public String servicelist() {
		ss = new String[3];
		
		for(int i = 0; i < types.length; i++){
			s = new String[3];
			
			s[0] = types[i].getTitle();
			s[1] = color[i+2];
			s[2] = String.valueOf(this.serviceItemService.countByType(types[i]));
			ss[i] = s[2];
			
			this.list.add(s);
		}
		
		return "servicelist";
	}
	
	public String contributsearch() {

		this.cslist = this.customerService.findAll();
		if(this.customerId == 0){
			return contributlist();
		}else {
			this.customer = this.customerService.findCustomerById(this.customerId);
			
			this.oflist = new ArrayList<OrderForm>(this.customer.getOrderForms());
			
			this.priceCount = new Integer[7];
			
			if(this.year.equals("全部")){
				
				String[] years = {"2009","2010","2011","2012","2013","2014"};
				s = years;
				
				for(int j = 0; j < s.length; j++){
					ss = new String[3];
					this.priceCount[j] = 0;
					ss[0] = s[j];
					ss[1] = this.customer.getName();
					
					//取得某年某客户所有订单总额
					for(int i = 0; i < oflist.size(); i++){
						OrderForm of = oflist.get(i);
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
						String y = sdf.format(of.getCreateDate());
						
						//如果某订单时间符合条件，加入计算总和
						if (y.equals(s[j])){
							this.priceCount[j] += of.getPriceCount();
						}
					}
					
					ss[2] = this.priceCount[j].toString();
					
					
					this.list.add(ss);
				}
				
				return "cuslist";
				
			}else{
				
				s = new String[7];
				
				for(int j = 0; j < oflist.size(); j++){
					
					OrderForm of = oflist.get(j);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
					String y = sdf.format(of.getCreateDate());
					
					//如果某订单时间符合条件，加入计算总和
					if (y.equals(this.year)){
						ss = new String[4];
						
						ss[0] = of.getId().toString();
						
						s[this.list.size()] = ss[0];
						
						ss[1] = this.customer.getName();
						
						SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						
						ss[2] = df.format(of.getCreateDate());
						
						ss[3] = String.valueOf(of.getPriceCount());
						
						this.priceCount[this.list.size()] = of.getPriceCount();
						
						this.list.add(ss);
					}
					if(this.list.size()==7)
					{
						j = oflist.size();
					}
					
				}
				
				if(this.priceCount[1] == null)
					this.priceCount[this.list.size()] = 0;
				
				return "cusyearlist";
			}
		}
	}
	
	public String contributlist() {

		this.cslist = this.customerService.findAll();
		
		this.clist = this.customerService.findByPage(0, 10);
		ss = new String[10];
		this.priceCount = new Integer[10];
		for(int i = 0; i < this.clist.size(); i++){
			s = new String[3];
			this.customer = this.clist.get(i);
			
			s[0] = this.customer.getId().toString();
			s[1] = this.customer.getName();
			
			this.priceCount[i] = 0;
			
			this.oflist = new ArrayList<OrderForm>(this.customer.getOrderForms());			
			
			for(int j = 0; j < this.oflist.size(); j++){
				this.priceCount[i] += Integer.valueOf(this.oflist.get(j).getPriceCount());
			}
			
			s[2] = String.valueOf(this.priceCount[i]);
			this.list.add(s);
			ss[i] = s[0];
		}
		
		return "contributlist";
	}
	
	public String constlist() {
		ss = new String[5];
		
		if(this.check == null)
			this.check = "1";
		
		if(this.check.equals("1")){
			for(int i = 0; i < ranks.length; i++){
				s = new String[3];
				
				s[0] = ranks[i].getTitle();
				s[1] = color[i];
				s[2] = String.valueOf(this.customerService.countByRank(ranks[i]));
				ss[i] = s[2];
				
				this.list.add(s);
			}
			return "ranklist";
		}else if(this.check.equals("2")){
			for(int i = 0; i < 5; i++){
				s = new String[3];
				
				s[0] = String.valueOf(i+1);
				s[1] = color[i];
				s[2] = String.valueOf(this.customerService.countByCredit(String.valueOf(i)));
				ss[i] = s[2];
				
				this.list.add(s);
			}
			return "creditlist";
		}else if(this.check.equals("3")){
			for(int i = 0; i < ranks.length; i++){
				s = new String[3];
				
				s[0] = String.valueOf(i+1);
				s[1] = color[i];
				s[2] = String.valueOf(this.customerService.countBySatisfication(String.valueOf(i)));
				ss[i] = s[2];
				
				this.list.add(s);
			}
			return "satisflist";
		}
		
		return "constlist";
	}

	@Override
	public void prepare() throws Exception {
		this.customer = new Customer();
	}

	@Override
	public Customer getModel() {
		return this.getCustomer();
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Rank[] getRanks() {
		return ranks;
	}

	public void setRanks(Rank[] ranks) {
		this.ranks = ranks;
	}

	public List<String[]> getList() {
		return list;
	}

	public void setList(List<String[]> list) {
		this.list = list;
	}

	public String[] getS() {
		return s;
	}

	public void setS(String[] s) {
		this.s = s;
	}

	public String[] getSs() {
		return ss;
	}

	public void setSs(String[] ss) {
		this.ss = ss;
	}

	public String[] getColor() {
		return color;
	}

	public void setColor(String[] color) {
		this.color = color;
	}

	public String[] getHighlight() {
		return highlight;
	}

	public void setHighlight(String[] highlight) {
		this.highlight = highlight;
	}

	public String getCheck() {
		return check;
	}

	public void setCheck(String check) {
		this.check = check;
	}

	public List<Customer> getClist() {
		return clist;
	}

	public void setClist(List<Customer> clist) {
		this.clist = clist;
	}

	public List<OrderForm> getOflist() {
		return oflist;
	}

	public void setOflist(List<OrderForm> oflist) {
		this.oflist = oflist;
	}

	public Integer[] getPriceCount() {
		return priceCount;
	}

	public void setPriceCount(Integer[] priceCount) {
		this.priceCount = priceCount;
	}

	public ServiceType[] getTypes() {
		return types;
	}

	public void setTypes(ServiceType[] types) {
		this.types = types;
	}

	public List<Customer> getCslist() {
		return cslist;
	}

	public void setCslist(List<Customer> cslist) {
		this.cslist = cslist;
	}

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
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

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public List<Integer> getPages() {
		return pages;
	}

	public void setPages(List<Integer> pages) {
		this.pages = pages;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

}
