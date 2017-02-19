package com.tanmoy.contacts;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tanmoy.student.dto.Contact;
import com.tanmoy.student.service.StudentService;

@RequestMapping("/secure")
@Controller
public class StudentController {
	
	@Autowired
    private StudentService service;
	
	@RequestMapping(value="/home")
	public ModelAndView homePage(ModelAndView model) {
		String name = getUserId();
		List<Contact> listContact = service.getContacts(name);
	    model.addObject("listContact", listContact);
	    model.setViewName("home");
	 
	    return model;
 	}    
	
	@RequestMapping(value="/userdetail")
	public String userDetail(Model model) {
 		return "userdetails";
 	}
	
	@RequestMapping(value="/newContact", method=RequestMethod.GET)
	public ModelAndView newContact(ModelAndView model) {
		Contact newContact = new Contact();
	    model.addObject("contact", newContact);
	    model.setViewName("ContactForm");
	    return model;
	}
	
	@RequestMapping(value = "/saveContact", method = RequestMethod.POST)
	public ModelAndView saveContact(@ModelAttribute Contact contact) {
		String name = getUserId();
	    service.saveOrUpdate(contact,name);
	    return new ModelAndView("redirect:/");
	}

	private String getUserId() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String name = auth.getName();
		return name;
	}
	
	@RequestMapping(value = "/editContact", method = RequestMethod.GET)
	public ModelAndView editContact(@RequestParam String contact_id) {
	    Contact contact = service.getContact(contact_id);
	    ModelAndView model = new ModelAndView("ContactForm");
	    model.addObject("contact", contact);
	    return model;
	}
	
	@RequestMapping(value = "/deleteContact", method = RequestMethod.GET)
	public ModelAndView deleteContact(@RequestParam String contact_id) {
	    service.deleteContact(contact_id);
	    return new ModelAndView("redirect:/");
	}
}
