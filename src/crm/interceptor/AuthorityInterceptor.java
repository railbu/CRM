package crm.interceptor;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import crm.model.User;
import crm.model.UserAuthority;
import crm.service.UserAuthorityService;

public class AuthorityInterceptor extends AbstractInterceptor{

	private static final long serialVersionUID = 4563924165920621436L;
	@Autowired private UserAuthorityService uaService;
	
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		Map<String,Object> session =  invocation.getInvocationContext().getSession();
		User currentUser =  (User) session.get("currentUser");
		System.out.println("已进入拦截器");
		
		if(currentUser == null)
		{
			System.out.println("当前用户未登录");
			return "login";
		}
		
		//找出所有权限存入Session
		List<UserAuthority> ualist = uaService.findAllByPower(currentUser.getPower());
		String authority = "";
		for(int i=0;i<ualist.size();i++){
			if(ualist.get(i).getOnoff().equals("true"))
				authority += ("|"+ualist.get(i).getAuthority().getMethodName());
		}
		ActionContext.getContext().getSession().put("authority", authority);
		
		String methodName = invocation.getInvocationContext().getName();
		System.out.println("methodName="+methodName);
		
		//uaService = new UserAuthorityService();
		UserAuthority ua = uaService.findUA(currentUser.getPower(), methodName);
		if(ua != null)
			System.out.println("值"+ua.getOnoff());
		if(ua!= null && ua.getOnoff().equals("true"))
			return invocation.invoke(); 
		else
			return "noAuth";
	}
}
