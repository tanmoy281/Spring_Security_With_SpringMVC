package com.tanmoy.student.service;

import java.util.List;

import com.tanmoy.student.dto.Contact;
import com.tanmoy.student.dto.User;


public interface StudentService {
	public void registerNewUser(User u);
	public List<Contact> getContacts(String userId);
	public void saveOrUpdate(Contact contact,String username);
	public Contact getContact(String contact_id);
	public void deleteContact(String contact_id);
}
