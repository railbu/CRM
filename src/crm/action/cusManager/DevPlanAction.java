package crm.action.cusManager;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import crm.action.support.Message;
import crm.action.support.MessageType;
import crm.model.CusDevPlan;
import crm.model.SaleOpportunity;
import crm.model.User;
import crm.service.DevPlanService;
import crm.service.OpportunityService;

@Controller
@Scope("request")
public class DevPlanAction extends ActionSupport implements Preparable,ModelDriven<CusDevPlan> {

	private static final long serialVersionUID = 1L;
	
	@Autowired private OpportunityService opportunityService;
	@Autowired private DevPlanService devplanService;
	
	private Long planid;
	private CusDevPlan plan;
	private SaleOpportunity planopt;
	private List<CusDevPlan> planlist;
	private Long optid;
	private List<SaleOpportunity> optlist;
	
	//分页
	private List<Integer> pages = new ArrayList<Integer>();
	private int currentPage = 1;
	private int pageCount;
	private int lastPage;
	private int nextPage;
	private int pageSize = 10;
	private Message message1;
	
	private User user;
	
	private String cusName = "";
	private String sum = "";
	private String contName = "";
	private String resTip;
	
//	public String optlist(){
//		user = (User) ActionContext.getContext().getSession().get("currentUser");
//		try{
//			int count = 0;
//			if(user.getPower()==1)
//				count = opportunityService.countAllByState();
//			if(user.getPower()==2)
//				count = opportunityService.countAllByPerson(user);;
//			System.out.println("Count="+count);
//			pageCount = count/pageSize+(count%pageSize==0?0:1);
//			
//			//设置leftPage 和 nextPage
//			lastPage = currentPage == 1?1:currentPage-1;
//			nextPage = currentPage == pageCount?currentPage:currentPage+1;
//			
//			
//			System.out.println("pageCount="+pageCount);
//			for(int i=1;i<=pageCount;i++){
//				pages.add(i);
//			}
//			
//			if(user.getPower()==1)	
//				optlist =  opportunityService.findByState((currentPage-1)*pageSize, pageSize);
//			if(user.getPower()==2)
//				optlist =  opportunityService.findByPerson((currentPage-1)*pageSize, pageSize,user);;
//			return "optlist";
//		}catch(Exception e){
//			e.printStackTrace();
//			System.out.println(e.getMessage());
//		}
//		return "optlist";
//	}
	
	public String optlist(){
    	user = (User) ActionContext.getContext().getSession().get("currentUser");
		try{
			int count=0;
			if(user.getPower()==1)
				count = opportunityService.countByCriteria(cusName, sum, contName,"yy");
			if(user.getPower()==2)
				count = opportunityService.countByCusCriteria(cusName, sum, contName,user,"yy");
			pageCount = count/pageSize+(count%pageSize==0?0:1);
			
			//设置leftPage 和 nextPage
			lastPage = currentPage == 1?1:currentPage-1;
			nextPage = currentPage == pageCount?currentPage:currentPage+1;
			
			
			System.out.println("pageCount="+pageCount);
			for(int i=1;i<=pageCount;i++){
				pages.add(i);
			}
			
			if(user.getPower()==1)
				optlist =  opportunityService.findByCriteria(cusName, sum, contName, (currentPage-1)*pageSize, pageSize,"yy");
			if(user.getPower()==2)
				optlist =  opportunityService.findByCusCriteria(cusName, sum, contName, (currentPage-1)*pageSize, pageSize,user,"yy");
			
			return "optlist";
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return "optlist";
	}
	
	public String list(){
		try{
			this.planopt = this.opportunityService.findOpportunityById(optid);
			planlist = devplanService.findPlanByOpt(planopt);
			return "list";
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return "list";
	}
	
	public boolean saveValidation(){
		if(StringUtils.isEmpty(plan.getContent()))
		{
			super.addFieldError("content","计划项不能为空！");
			return false;
		}
		return true;
	}
	
	public String save(){
		if(!saveValidation())
			return list();
//		System.out.println("yooooooooooooooooooooooooooooo");
		if(this.optid != null){
			this.planopt = this.opportunityService.findOpportunityById(optid);
//			if(planopt.getDevelopState().equals("未开发"))
			planopt.setDevelopState("开发中");
			plan.setSaleOpp(planopt);
		}
		try{
			this.devplanService.save(this.plan);
			return list();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		message1 = new Message("保存成功","",MessageType.success);
		return list();
	}

	public String edit(){
		try{
			this.planopt = this.opportunityService.findOpportunityById(optid);
			planlist = devplanService.findPlanByOpt(planopt);
			return "edit";
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return "edit";
	}
	
	public String make(){
//		System.out.println("yooooooooooooooooooooooooooooo");
		if(this.optid != null){
			this.planopt = this.opportunityService.findOpportunityById(optid);
			plan.setSaleOpp(planopt);
		}
		try{
			this.devplanService.save(this.plan);
			return edit();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		message1 = new Message("保存成功","",MessageType.success);
		resTip = "保存成功";
		return edit();
	}
	public String moreinfo(){
		try{
			this.planopt = this.opportunityService.findOpportunityById(optid);
			planlist = devplanService.findPlanByOpt(planopt);
			return "moreinfo";
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return "moreinfo";
	}
	
	public String success(){
		if(this.optid != null){
			this.planopt = this.opportunityService.findOpportunityById(optid);
			planopt.setDevelopState("开发成功");
		}
		return optlist();
	}
	public String fail(){
		if(this.optid != null){
			this.planopt = this.opportunityService.findOpportunityById(optid);
			planopt.setDevelopState("开发失败");
		}
		return optlist();
	}
	
	public String delete(){
		try{
			devplanService.delete(planid);
			return list();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return list();
	}
	
	
	
	public List<CusDevPlan> getPlanlist() {
		return planlist;
	}

	

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		prepareModel();
	}

	@Override
	public CusDevPlan getModel() {
		// TODO Auto-generated method stub
		return this.plan;
	}
	private void prepareModel(){
		if(this.planid != null)
			this.plan = this.devplanService.getCusDevPlan(planid);
		else
			this.plan= new CusDevPlan();
	}
	public Long getPlanid() {
		return planid;
	}

	public void setPlanid(Long planid) {
		this.planid = planid;
	}

	public CusDevPlan getPlan() {
		return plan;
	}

	public Long getOptid() {
		return optid;
	}

	public void setOptid(Long optid) {
		this.optid = optid;
	}

	public SaleOpportunity getPlanopt() {
		return planopt;
	}

	public void setPlanopt(SaleOpportunity planopt) {
		this.planopt = planopt;
	}

	public List<SaleOpportunity> getOptlist() {
		return optlist;
	}

	public void setOptlist(List<SaleOpportunity> optlist) {
		this.optlist = optlist;
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

	public void setPlan(CusDevPlan plan) {
		this.plan = plan;
	}

	public void setPlanlist(List<CusDevPlan> planlist) {
		this.planlist = planlist;
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

	public Message getMessage1() {
		return message1;
	}

	public void setMessage1(Message message1) {
		this.message1 = message1;
	}

	public String getResTip() {
		return resTip;
	}

	public void setResTip(String resTip) {
		this.resTip = resTip;
	}
	
}
