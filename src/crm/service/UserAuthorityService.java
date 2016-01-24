package crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import crm.dao.UserAuthorityDao;
import crm.model.User;
import crm.model.UserAuthority;

@Component
public class UserAuthorityService {
	
	@Autowired private UserAuthorityDao userAuthorityDao;
	
	public UserAuthority findUA(int power,String methodName){
		return userAuthorityDao.findUA(power, methodName);
	}
	
	public List<UserAuthority> findAllByPower(int power){
		return userAuthorityDao.findAllByPower(power);
	}
	
	public void save(UserAuthority ua){
		userAuthorityDao.save(ua);
	}
}
