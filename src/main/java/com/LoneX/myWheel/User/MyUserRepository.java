package com.LoneX.myWheel.User;


import org.springframework.data.repository.CrudRepository;

public interface MyUserRepository extends CrudRepository <MyUser , Integer>{

	public MyUser findByEmail(String email);
	
	

}
