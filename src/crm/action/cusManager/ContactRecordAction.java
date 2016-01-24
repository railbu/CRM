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

import crm.model.ContactRecord;
import crm.model.Customer;
import crm.service.ContactRecordService;
import crm.service.CustomerService;

@Controller
@Scope("request")
public class ContactRecordAction extends ActionSupport implements Preparable,ModelDriven<ContactRecord> {

	private static final long serialVersionUID = 1L;
	
	@Autowired private CustomerService customerService;
	@Autowired private ContactRecordService contactRecordService;
	private Long id;
	private Long myid;
	private Long cnmid;
	private Customer customer;
	private ContactRecord contactRecord;
	private List<ContactRecord> list;
	
	//分页
	private List<Integer> pages = new ArrayList<Integer>();
	private int currentPage = 1;
	private int pageCount;
	private int lastPage;
	private int nextPage;
	private int pageSize = 3;
	
	public String list(){
		this.customer = this.customerService.findCustomerById(this.myid);
		ActionContext.getContext().put("customer", customer);
		
		if(customer.getContactRecords() != null){
			this.list = new ArrayList<ContactRecord>(customer.getContactRecords());
		
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
		}
		
		return "list";
	}
	
	public String delete() {
		this.customer = this.customerService.findCustomerById(this.myid);
		this.contactRecord = this.contactRecordService.findContactRecord(this.cnmid);
		this.customer.getContactRecords().remove(this.contactRecord);
		this.contactRecordService.delete(this.cnmid);
		return list();
	}
	
	public String edit(){
		System.out.println("cnmid"+cnmid);
		this.contactRecord = this.contactRecordService.findContactRecord(this.cnmid);
		return INPUT;
	}
	
	public String add(){

		return INPUT;
	}
	
	public String save() {
		try{
			
			this.customer = this.customerService.findCustomerById(this.myid);
			this.contactRecord.setCustomer(this.customer);
			this.customer.addContactRecord(this.contactRecord);
			this.contactRecordService.save(this.contactRecord);
			this.customerService.save(this.customer);
			
			return list();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return list();
	}
	
	@Override
	public ContactRecord getModel() {
		return this.contactRecord;
	}
	
	private void prepareModel(){
		if (this.cnmid != null) {
			this.contactRecord = this.contactRecordService.findContactRecord(this.cnmid);
		} else {
			this.contactRecord = new ContactRecord();
		}
			
		
	}

	@Override
	public void prepare() throws Exception {
		prepareModel();
		
	}

	public List<ContactRecord> getList() {
		return list;
	}

	public void setList(List<ContactRecord> list) {
		this.list = list;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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


	public Long getMyid() {
		return myid;
	}


	public void setMyid(Long myid) {
		this.myid = myid;
	}

	public ContactRecord getContactRecord() {
		return contactRecord;
	}

	public void setContactRecord(ContactRecord contactRecord) {
		this.contactRecord = contactRecord;
	}

	public Long getCnmid() {
		return cnmid;
	}

	public void setCnmid(Long cnmid) {
		this.cnmid = cnmid;
	}
	
}
