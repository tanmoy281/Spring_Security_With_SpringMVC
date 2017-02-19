package com.tanmoy.contacts;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tanmoy.student.dto.User;
import com.tanmoy.student.service.StudentService;

@Controller
public class RegisterController {
	
	@Autowired
    private StudentService studentService;
	
	
	@RequestMapping(value="/registerme", method=RequestMethod.POST)
	public String registerme(@RequestParam("username") String username,
			@RequestParam("password") String password,@RequestParam("name") String name) {
 		
		User u= new User();
		u.setName(name);
		u.setPassword(password);
		u.setUsername(username);
		studentService.registerNewUser(u);
		
		return "registered";
 	} 
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String register(){
		return "register";
	}
	
	@RequestMapping(value="/")
	public String home() {
		return "redirect:customLogin.jsp";
 	}
	
}
