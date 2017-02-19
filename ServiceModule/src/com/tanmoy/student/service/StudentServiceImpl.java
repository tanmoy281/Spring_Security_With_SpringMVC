package com.tanmoy.student.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tanmoy.student.dao.RegisterDao;
import com.tanmoy.student.dto.Contact;
import com.tanmoy.student.dto.User;

@Service
public class StudentServiceImpl implements StudentService{
	
	@Autowired
	RegisterDao dao;
	
	public void registerNewUser(User u){
		dao.addUser(u);
	}

	public List<Contact> getContacts(String userId) {
		return dao.getAllContactsForUser(userId);
	}

	public void saveOrUpdate(Contact contact,String username) {
		dao.saveOrUpdate(contact,username);
		
	}

	public Contact getContact(String contact_id) {
		Contact c=dao.getContact(contact_id);
		return c;
	}

	public void deleteContact(String contact_id) {
		dao.deleteContactOfUser(contact_id);
		
	}
} 