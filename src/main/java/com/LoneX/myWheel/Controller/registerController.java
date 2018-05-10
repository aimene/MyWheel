package com.LoneX.myWheel.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.LoneX.myWheel.User.MyUser;
import com.LoneX.myWheel.User.MyUserService;

@Controller
public class registerController {
	
	@Autowired
	MyUserService userService;
	@Autowired
	JdbcUserDetailsManager userDetailsManager;
	
	@RequestMapping("/register")
	public ModelAndView newRegister() {
		
		return new ModelAndView("register","user",new MyUser());
	}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public ModelAndView answerRegister(@ModelAttribute("user") MyUser myUser) {
		userService.addMyUser(myUser);
		
		
		 List<MyUser> userList=userService.getAllMyUsers();
			for(MyUser user2 : userList) {
				System.out.println("userFound! name: "+user2.getName());
			}
			
		
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority("ROLE_CLIENT"));
		
		
		User user = new User(myUser.getEmail() , myUser.getPass() , authorities);
		userDetailsManager.createUser(user);
		
		
		ModelAndView model=new ModelAndView();
		
		
		model.setViewName("redirect:/login");
		return model;
	}
	
	@RequestMapping("/allusers")
	public ModelAndView allUsers() {
		
		ModelAndView model=new ModelAndView("AllUsers");
		
		 List<MyUser> userList=userService.getAllMyUsers();
			for(MyUser user2 : userList) {
				System.out.println("userFound! name: "+user2.getName());
				System.out.println("	  lastName: "+user2.getLastName());
				System.out.println("	  email: "+user2.getEmail());
				System.out.println("	  pass: "+user2.getPass());

			}
			
		model.addObject("userList",userList);
		return model;

	}
}
