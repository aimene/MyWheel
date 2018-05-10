package com.LoneX.myWheel.Controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


import com.LoneX.myWheel.User.MyUserService;

@RestController
public class LoginController {

	@Autowired
	MyUserService myUserService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login( String error, String logout) {
		
		
		ModelAndView model=new ModelAndView("login");
		
        if (error != null)
            model.addObject("errorMsg", "Vous n'etes pas inscrit");

        if (logout != null)
            model.addObject("msg", "Au revoire !");
       
    
        
        return model;
    }
	
	@RequestMapping("/forgot-password")
	public ModelAndView freakingPass() {
		return new ModelAndView("forgot-password");
	}
}
