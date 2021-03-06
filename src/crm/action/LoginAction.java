package crm.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import crm.model.User;
import crm.model.UserAuthority;
import crm.service.MeasureService;
import crm.service.UserAuthorityService;
import crm.service.UserService;
import crm.utils.MD5Util;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

@Controller
@Scope("request")
public class LoginAction extends ActionSupport implements Preparable{
	private static final long serialVersionUID = 4844650480228922590L;

	private String username;
	private String password;
	@Autowired private UserService userService;
	@Autowired private UserAuthorityService uaService;
	@Autowired private MeasureService mService;
	
	public String logout(){
		ActionContext.getContext().getSession().remove("currentUser");
		return "login";
	}
	
	public String login(){
		System.out.println(username + ":"+password );
		try{
			User user = userService.findUser(username);
			//if(MD5Util.MD5(password).equals(user.getPassw	ord())){
			if(password.equals(user.getPassword())){	
				ActionContext.getContext().getSession().put("currentUser",user);
				ActionContext.getContext().getSession().put("power",""+user.getPower());
				
				//找出所有权限存入Session
				List<UserAuthority> ualist = uaService.findAllByPower(user.getPower());
				String authority = "";
				for(int i=0;i<ualist.size();i++){
					if(ualist.get(i).getOnoff().equals("true"))
						authority += ("|"+ualist.get(i).getAuthority().getMethodName());
				}
				System.out.println("权限"+authority);
				ActionContext.getContext().getSession().put("authority", authority);
				if(user.getPower() == 2){
					int liushi = mService.countAllByRes("", "", "预警");
					System.out.println("预警="+liushi);
					ActionContext.getContext().getSession().put("liushi",liushi);
				}
				
				return "home";
				
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return INPUT;
	}
	
	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
