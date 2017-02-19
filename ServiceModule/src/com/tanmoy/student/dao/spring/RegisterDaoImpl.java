package com.tanmoy.student.dao.spring;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.tanmoy.student.dao.RegisterDao;
import com.tanmoy.student.dto.Contact;
import com.tanmoy.student.dto.User;

@Repository
public class RegisterDaoImpl implements RegisterDao {

	@Autowired
	private JdbcTemplate jdbcTemplate; // this is same as constructor and setter
										// injection.

	private static final String INSERT_NEW_USER = "insert into users values(?,?,?)";
	private static final String INSERT_NEW_USER_ROLE = "insert into user_roles(username,role) values(?,?)";

	private static final String GET_ALL_CONTACTS = "SELECT * FROM contact where userid=?";
	private static final String UPDATE_CONTACT = "UPDATE contact SET name=?, email=?, address=?, "
			+ "telephone=?,userid=? WHERE contact_id=?";
	private static final String ADD_CONTACT = "INSERT INTO contact (name, email, address, telephone,userid)"
			+ " VALUES (?, ?, ?, ?,?)";
	private static final String GET_A_CONTACT = "SELECT * FROM contact where contact_id=?";
	private static final String DELETE_A_CONTACT = "DELETE FROM contact WHERE contact_id=?";
	
	//If you don't want to use ? then use NamedParameterJdbcTemplate instead
	/*
	 * @Autowired public RegisterRepository(JdbcTemplate jdbcTemplate){
	 * this.jdbcTemplate=jdbcTemplate; }
	 */

	@Override
	public void addUser(User u) {
		jdbcTemplate.update(INSERT_NEW_USER, u.getUsername(), u.getPassword(), 1);
		jdbcTemplate.update(INSERT_NEW_USER_ROLE, u.getUsername(), "ROLE_ADMIN");
	}

	@Override
	public List<Contact> getAllContactsForUser(String userId) {

		List<Contact> listContact;

		listContact = jdbcTemplate.query(GET_ALL_CONTACTS, new Object[]{userId},new ContactMapper());

		return listContact;
	}

	@Override
	public void saveOrUpdate(Contact contact, String userId) {
		if (contact.getId() > 0) {
			// update

			jdbcTemplate.update(UPDATE_CONTACT, contact.getName(), contact.getEmail(), contact.getAddress(),
					contact.getTelephone(), userId, contact.getId());
		} else {
			// insert

			jdbcTemplate.update(ADD_CONTACT, contact.getName(), contact.getEmail(), contact.getAddress(),
					contact.getTelephone(), userId);
		}

	}

	@Override
	public Contact getContact(String contactId) {
		Contact c;
		c = jdbcTemplate.queryForObject(GET_A_CONTACT, new Object[] { contactId }, new ContactMapper());
		return c;

	}

	@Override
	public void deleteContactOfUser(String contact_id) {
		jdbcTemplate.update(DELETE_A_CONTACT, contact_id);
	}
}
