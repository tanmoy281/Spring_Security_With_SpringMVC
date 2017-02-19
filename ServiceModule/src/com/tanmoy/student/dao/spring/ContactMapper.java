package com.tanmoy.student.dao.spring;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.tanmoy.student.dto.Contact;


public class ContactMapper implements RowMapper<Contact> {

	@Override
	public Contact mapRow(ResultSet rs, int arg1) throws SQLException {
		Contact contact = new Contact();
		contact.setId((Integer) (rs.getInt("contact_id")));
		contact.setName((String) rs.getString("name"));
		contact.setAddress((String) rs.getString("address"));
		contact.setEmail((String) rs.getString("email"));
		contact.setTelephone((String) rs.getString("telephone"));
		return contact;
	}

}
