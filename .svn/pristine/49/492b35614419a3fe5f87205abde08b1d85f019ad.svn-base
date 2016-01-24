package crm.action.cusManager;

import java.util.ArrayList;
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
import com.opensymphony.xwork2.Preparable;

import crm.model.Contact;
import crm.model.Customer;
import crm.service.ContactService;
import crm.service.CustomerService;

@Controller
@Scope("request")
public class ContactAction extends ActionSupport implements Preparable,
		ModelDriven<Contact> {

	private static final long serialVersionUID = 1L;

	@Autowired
	private CustomerService customerService;
	@Autowired
	private ContactService contactService;
	private Long id;
	private long cnbid;
	private long contactId;
	private Customer customer;
	private Contact contact;
	private List<Contact> list;

	// 分页
	private List<Integer> pages = new ArrayList<Integer>();
	private int currentPage = 1;
	private int pageCount;
	private int lastPage;
	private int nextPage;
	private int pageSize = 3;

	// 初始化contact列表
	public String listContact() {
		this.customer = this.customerService.findCustomerById(cnbid);
		ActionContext.getContext().put("customer", customer);

		if (customer.getContacts() != null) {
			this.list = new ArrayList<Contact>(customer.getContacts());

			int count = this.list.size();
			pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

			// 设置leftPage 和 nextPage
			lastPage = currentPage == 1 ? 1 : currentPage - 1;
			nextPage = currentPage == pageCount ? currentPage : currentPage + 1;

			for (int i = 1; i <= pageCount; i++) {
				pages.add(i);
			}

			if ((currentPage - 1) * pageSize + pageSize >= this.list.size()) {
				this.list = this.list.subList((currentPage - 1) * pageSize,
						this.list.size());
			} else {
				this.list = this.list.subList((currentPage - 1) * pageSize,
						(currentPage - 1) * pageSize + pageSize);
			}
		}

		return SUCCESS;
	}

	public static boolean isNumeric(String str) {
		Pattern pattern = Pattern.compile("[0-9]*");
		return pattern.matcher(str).matches();
	}

	public static boolean containsNum(String str){
		Pattern p = Pattern.compile("[0-9]");
		Matcher m = p.matcher(str); 
		while(m.find()){
			return true;
		}
		return false;
	}
	
	public static boolean StringFilter(String str) throws PatternSyntaxException {
		// 只允许字母和数字
		// String regEx = "[^a-zA-Z0-9]";
		// 清除掉所有特殊字符
		String regEx = "[`~!@#$%^&*()+=|{}':;',//[//].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(str); 
		while(m.find()){
			return true;
		}
		return false;
	}

	public boolean saveValidation() {
		int flag = 0;
		if (StringUtils.isEmpty(contact.getName())
				|| StringUtils.isEmpty(contact.getGender())
				|| StringUtils.isEmpty(contact.getMobilePhone())
				|| StringUtils.isEmpty(contact.getPosition())) {
			super.addFieldError("name", "请填写完整信息");
			flag = 1;
			return false;
		}
		if (contact.getName().length() > 16 || StringFilter(contact.getName()) || containsNum(contact.getName())) {
			super.addFieldError("name", "姓名格式不正确");
			flag = 1;
			return false;
		}
		if (!isNumeric(contact.getMobilePhone())
				|| contact.getMobilePhone().length() != 11) {
			super.addFieldError("mobile", "手机号格式不正确");
			flag = 1;
			return false;
		}
		if (!isNumeric(contact.getOfficePhone())) {
			super.addFieldError("mobile", "办公电话格式不正确");
			flag = 1;
			return false;
		}
		if (StringFilter(contact.getPosition()) || StringFilter(contact.getPosition()) || containsNum(contact.getPosition())) {
			super.addFieldError("mobile", "职位格式不正确");
			flag = 1;
			return false;
		}
		if (flag == 1)
			return false;
		return true;
	}

	// 跳转页面
	public String add() {
		return "add";
	}

	// 执行添加
	public String addContact() {
		if(!saveValidation())
			return "add";
		
		this.customer = this.customerService.findCustomerById(cnbid);
		// this.contact.setCustomer(this.customerService.loadCustomer(cnbid));
		this.customer.addContact(this.contact);
		// this.customerService.save(this.customer);
		return listContact();
	}

	// 跳转编辑
	public String edit() {
		this.contact = contactService.findContactById(this.contactId);
		ActionContext.getContext().put("contact", this.contact);
		return "edit";
	}

	// 先删再添
	public String editContact() {
		if(!saveValidation()){
			edit();
		}	
		this.customer = this.customerService.findCustomerById(cnbid);
		System.out.println(this.contactId);
		Contact con = this.contactService.findContactById(this.contactId);
		this.contactService.delContact(con);
		this.customer.addContact(contact);
		return listContact();
	}

	public String del() {
		this.contact = contactService.findContactById(this.contactId);
		this.customer = this.customerService.findCustomerById(cnbid);
		this.customer.getContacts().remove(this.contact);
		this.customerService.save(this.customer);
		this.contactService.delContact(this.contact);
		return listContact();
	}

	@Override
	public Contact getModel() {
		return this.contact;
	}

	@Override
	public void prepare() throws Exception {
		this.contact = new Contact();

	}

	public long getCnbid() {
		return cnbid;
	}

	public void setCnbid(long cnbid) {
		this.cnbid = cnbid;
	}

	public long getContactId() {
		return contactId;
	}

	public void setContactId(long contactId) {
		this.contactId = contactId;
	}

	public List<Contact> getList() {
		return list;
	}

	public void setList(List<Contact> list) {
		this.list = list;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
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

}
