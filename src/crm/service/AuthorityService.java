package crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import crm.dao.AuthorityDao;
import crm.model.Authority;

@Component
public class AuthorityService {
	@Autowired AuthorityDao authorityDao;
	
	public List<Authority> findAll(){
		return authorityDao.findAll();
	}
	
}
