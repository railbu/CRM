package crm.action.cusManager;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import crm.model.SaleOpportunity;
import crm.model.User;
import crm.service.OpportunityService;
import crm.service.UserService;

@Controller
@Scope("request")
public class OpportunityAction extends ActionSupport implements Preparable,ModelDriven<SaleOpportunity> {

	private static final long serialVersionUID = 1L;
	
	@Autowired private UserService userService;
	@Autowired private OpportunityService opportunityService;
	
	private SaleOpportunity opportunity;
	private List<User> users = new ArrayList<User>();
    private Long optid;
	private String createUser;
	private List<SaleOpportunity> optlist;
	private Long userId;
	private Long aUserId;
	
	private String cusName = "";
	private String sum = "";
	private String contName = "";
	
	private User user;
	private User optCreateUser;
	
	//分页
	private List<Integer> pages = new ArrayList<Integer>();
	private int currentPage = 1;
	private int pageCount;
	private int lastPage;
	private int nextPage;
	private int pageSize = 10;
	
	public String list2(){
		user = (User) ActionContext.getContext().getSession().get("currentUser");
		try{
			int count=0;
			if(user.getPower()==1)
				count = opportunityService.countAll();
			if(user.getPower()==2)
				count = opportunityService.countAllByPerson(user);
			pageCount = count/pageSize+(count%pageSize==0?0:1);
			//设置leftPage 和 nextPage
			lastPage = currentPage == 1?1:currentPage-1;
			nextPage = currentPage == pageCount?currentPage:currentPage+1;
			
			
			for(int i=1;i<=pageCount;i++){
				pages.add(i);
			}
			if(user.getPower()==1)	
				optlist =  opportunityService.findByPage((currentPage-1)*pageSize, pageSize);
			if(user.getPower()==2)
				optlist =  opportunityService.findByPerson((currentPage-1)*pageSize, pageSize,user);
			return "list";
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return "list";
	}
	
    public String list(){
    	user = (User) ActionContext.getContext().getSession().get("currentUser");
		try{
			int count=0;
			if(user.getPower()==1)
				count = opportunityService.countByCriteria(cusName, sum, contName, null);
			if(user.getPower()==2)
				count = opportunityService.countByCusCriteria(cusName, sum, contName,user, null);
			pageCount = count/pageSize+(count%pageSize==0?0:1);
			
			//设置leftPage 和 nextPage
			lastPage = currentPage == 1?1:currentPage-1;
			nextPage = currentPage == pageCount?currentPage:currentPage+1;
			
			
			System.out.println("pageCount="+pageCount);
			for(int i=1;i<=pageCount;i++){
				pages.add(i);
			}
			
			if(user.getPower()==1)
				optlist =  opportunityService.findByCriteria(cusName, sum, contName, (currentPage-1)*pageSize, pageSize,null);
			if(user.getPower()==2)
				optlist =  opportunityService.findByCusCriteria(cusName, sum, contName, (currentPage-1)*pageSize, pageSize,user,null);
			
			return "list";
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return "list";
	}
	
	@SkipValidation
	public String add(){
		try{
			this.users = this.userService.findAllByType(2);
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return "add";
	}
	
	public String assign(){
		try{
			this.users = this.userService.findAllByType(2);
			this.opportunity = opportunityService.findOpportunityById(optid);
			if (this.opportunity.getId() != null){
				this.userId = this.opportunity.getCreatePerson().getId();
				this.setAUserId(this.opportunity.getCreatePerson().getId());
			}
		}catch(Exception e){
			e.getMessage();
			e.printStackTrace();
		}
		return "assign";
	}
	
	public boolean saveValidation(){
		if(StringUtils.isEmpty(opportunity.getCustomerName()))
		{
			super.addFieldError("customerName","客户名称不能为空！");
			return false;
		}
		
		if(StringUtils.isEmpty(opportunity.getSummary()))
		{
			super.addFieldError("summary","概要不能为空！");
			return false;
		}
		
		if(StringUtils.isEmpty(opportunity.getDescription()))
		{
			super.addFieldError("description","机会描述不能为空！");
			return false;
		}
		return true;
	}
	
	public String save(){
		
		if(!saveValidation())
			return "add";
			
		if (this.userId != null)
			opportunity.setCreatePerson(userService.loadUser(userId));
		if (this.aUserId != null)
		{
			opportunity.setAssignPerson(userService.loadUser(aUserId));
			opportunity.setAssignState("已指派");
		}else
		{
			opportunity.setAssignState("未分配");
		}
		try{
			opportunity.setDevelopState("未开发");
			this.opportunityService.save(this.opportunity);
			return list();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		System.out.println("~~~~~~~~~~~~~~~~"+opportunity.getAssignState());
		return list();
	}
	public String editSave(){
		
		if(!saveValidation())
			return "edit";
		
		System.out.println("daozhegle");
			
		if (this.userId != null)
			opportunity.setCreatePerson(userService.loadUser(userId));
		if (this.aUserId != null)
		{
			opportunity.setAssignPerson(userService.loadUser(aUserId));
			opportunity.setAssignState("已指派");
		}else
		{
			opportunity.setAssignState("未分配");
			opportunity.setDevelopState("未开发");
		}
		try{
			this.opportunityService.save(this.opportunity);
			return list();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return list();
	}
	public String edit(){
		try{
			this.users = this.userService.findAllByType(2);
			this.opportunity = opportunityService.findOpportunityById(optid);
			if (this.opportunity.getId() != null){
				this.userId = this.opportunity.getCreatePerson().getId();
			}
		}catch(Exception e){
			e.getMessage();
			e.printStackTrace();
		}
		return "edit";
	}
	public String moreinfo(){
		try{
			this.opportunity = opportunityService.findOpportunityById(optid);
		}catch(Exception e){
			e.getMessage();
			e.printStackTrace();
		}
		return "moreinfo";
	}
	
	public String delete(){
		user = (User) ActionContext.getContext().getSession().get("currentUser");
		optCreateUser = opportunityService.findOpportunityById(optid).getCreatePerson();
		try{
			System.out.println("optid = " + optid);
			if(user.getName().equals(optCreateUser.getName())){
				opportunityService.delete(optid);
			}else{
				super.addFieldError("deleteFail", "sorry,您没有删除此销售机会的权限~");
			}
			
			return list();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return list();
	}
	/**
	 * @return the list
	 */
	public List<SaleOpportunity> getOptlist() {
		return optlist;
	}
	
	@Override
	public SaleOpportunity getModel() {
		// TODO Auto-generated method stub
		return this.opportunity;
	}
	public SaleOpportunity getOpportunity() {
		return opportunity;
	}
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		prepareModel();
	}
	private void prepareModel(){
		if(this.optid != null)
			this.opportunity = this.opportunityService.getSaleOpportunity(optid);
		else
			this.opportunity= new SaleOpportunity();
	}
	
	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}
	
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public Long getOptid() {
		return optid;
	}

	public void setOptid(Long optid) {
		this.optid = optid;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public List<Integer> getPages() {
		return pages;
	}

	public void setPages(List<Integer> pages) {
		this.pages = pages;
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

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getCusName() {
		return cusName;
	}

	public void setCusName(String cusName) {
		this.cusName = cusName;
	}

	public String getSum() {
		return sum;
	}

	public void setSum(String sum) {
		this.sum = sum;
	}

	public String getContName() {
		return contName;
	}

	public void setContName(String contName) {
		this.contName = contName;
	}

	public Long getAUserId() {
		return aUserId;
	}

	public void setAUserId(Long aUserId) {
		this.aUserId = aUserId;
	}

}
