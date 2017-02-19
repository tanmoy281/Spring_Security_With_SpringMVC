package com.tanmoy.student.dao;

import java.util.List;

import com.tanmoy.student.dto.Contact;
import com.tanmoy.student.dto.User;

public interface RegisterDao {
	public void addUser(User u);

	public List<Contact> getAllContactsForUser(String userId);

	public void saveOrUpdate(Contact contact,String userId);

	public Contact getContact(String contact_id);

	public void deleteContactOfUser(String contact_id);
}