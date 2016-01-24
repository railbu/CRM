package crm.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import crm.dao.UserDao;
import crm.model.User;

@Component
public class UserService {
	
	@Autowired private  UserDao userDao;
	
	public User findUser(String username){
		return userDao.findUser(username);
	}
	
	public List<User> findAllByType(int type){
		return userDao.findAllByType(type);
	}
	
	public List<User> findAll(){
		return userDao.findAll();
	}
	
	public User loadUser(Long userId){
		return userDao.loadUser(userId);
	}
	
	public int countAll(){
		return userDao.countAll();
	}
	
	public List<User> findByPage(int pageNo,int pageSize){
		return userDao.findAllByPage(pageNo, pageSize);
	}
}
