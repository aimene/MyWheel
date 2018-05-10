package com.LoneX.myWheel.User;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class MyUserService {
	
	@Autowired
	MyUserRepository MyUserRepository;
	public MyUser getMyUser(String email) {
		return MyUserRepository.findByEmail(email);
	}
	public List<MyUser> getAllMyUsers(){
		
		List<MyUser> MyUserList=new ArrayList<MyUser>();
		MyUserRepository.findAll().forEach(MyUserList::add);;
	    return MyUserList;
	}
	
	public void addMyUser(MyUser MyUser) {
		MyUserRepository.save(MyUser);
	}
	
	public void removeMyUser(String email) {
		int id = MyUserRepository.findByEmail(email).getId();
	  
		MyUserRepository.delete(id);
	}
	
}
	
