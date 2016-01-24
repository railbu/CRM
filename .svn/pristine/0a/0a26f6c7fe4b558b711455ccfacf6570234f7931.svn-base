package crm.action.authority;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

import crm.model.Authority;
import crm.model.TAuthority;
import crm.model.User;
import crm.model.UserAuthority;
import crm.service.AuthorityService;
import crm.service.UserAuthorityService;
import crm.service.UserService;

@Controller
@Scope("request")
public class 
AuthorityAction extends ActionSupport implements Preparable{

	@Autowired private UserService userService;
	@Autowired private UserAuthorityService uaService;
	@Autowired private AuthorityService authorityService;
	
	private static final long serialVersionUID = 7198276205838359407L;
	private List<User> userList;
	private List<UserAuthority> uaList;
	private int power;
	
	//分页
	private List<Integer> pages = new ArrayList<Integer>();
	private int currentPage = 1;
	private int pageCount;
	private int lastPage;
	private int nextPage;
	private int pageSize = 10;
	
	public String listUser(){
		//神奇的一句话
		userService.loadUser(1L);
		
		userList = new ArrayList<User>();
		for(int i=0;i<4;i++){
			User u = new User();
			u.setId((long)i);
			u.setName("类型"+i);
			u.setPower(get2Power(i));
			userList.add(u);
		}
		return "userList";
	}
	
	//计算2的i次方
	public int get2Power(int i){
		if(i==0)
			return 1;
		return 2*get2Power(i-1);
	}
	
	public String uaDoList(){
		//将当前要修改权限的Power存入session
		ActionContext.getContext().getSession().put("changeAuPower", power);
		try{
			uaList = uaService.findAllByPower(power);
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return "uaList";
	}
	
	public void prepareSave(){
		int power = (int) ActionContext.getContext().getSession().get("changeAuPower");
		uaList = uaService.findAllByPower(power);
//		uaList = new ArrayList<UserAuthority>();
	}
	
	
	public String save(){
		System.out.println("保存的信息如下");
		System.out.println(uaList.get(0).getAuthority().getDescription());
		System.out.println(uaList.get(0).getOnoff());
		return listUser();
		//return uaDoList();
	}
	
	public String getPower(int x){
		String[] s = {"","销售主管","客户经理","","高管","","","","管理员"};
		return s[x];
	}
	
	private Long tuid;
	public String ini(){
		List<Authority> alist = authorityService.findAll();
		
		for(int i=0;i<alist.size();i++){
			UserAuthority ttua = new UserAuthority();
			ttua.setPower(tuid.intValue());
			ttua.setAuthority(alist.get(i));
			int v = Integer.valueOf(alist.get(i).getType());
			if((tuid & v)>0)
				ttua.setOnoff("true");
			else
				ttua.setOnoff("false");
			
			uaService.save(ttua);
		}
		return "ini";
	}
	
	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
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

	public List<UserAuthority> getUaList() {
		return uaList;
	}

	public void setUaList(List<UserAuthority> uaList) {
		this.uaList = uaList;
	}


	public Long getTuid() {
		return tuid;
	}

	public void setTuid(Long tuid) {
		this.tuid = tuid;
	}

	public int getPower() {
		return power;
	}

	public void setPower(int power) {
		this.power = power;
	}

}
