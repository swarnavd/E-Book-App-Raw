package com.dao;
import java.sql.*;

import com.entity.User;
public class Userdaoimpl implements Userdao{
	private Connection con;

	public Userdaoimpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public boolean userRegistre(User us) {
		boolean f=false;
		String sql="insert into registration(name,email,password,phone) values(?,?,?,?)";
		try {
			PreparedStatement st=con.prepareStatement(sql);
			
			st.setString(1,us.getName());
			st.setString(2,us.getEmail());
			st.setString(3,us.getPassword());
			st.setString(4,us.getPhone());
			int i=st.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		// TODO Auto-generated method stub
		return f;
	
	}

	@Override
	public User login(String email, String password) {
	    User us = null; // Initialize User object to null
	    String sql = "SELECT * FROM registration WHERE email = ? AND password = ?";
	    try {
	        // Prepare the SQL query
	        PreparedStatement st = con.prepareStatement(sql);
	        
	        // Set the parameters for the query
	        st.setString(1, email); // Replace the first '?' with the email
	        st.setString(2, password); // Replace the second '?' with the password
	        
	        // Execute the query
	        ResultSet rs = st.executeQuery();
	        
	        // Check if a result is returned
	        if (rs.next()) { // Move the cursor to the first row
	            us = new User(); // Create a new User object
	            us.setName(rs.getString("name")); // Get the 'name' column value
	            us.setEmail(rs.getString("email")); // Get the 'email' column value
	            us.setPassword(rs.getString("password")); // Get the 'password' column value
	            us.setPhone(rs.getString("phone")); // Get the 'phone' column value
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); // Print stack trace for debugging
	    }
	    return us; // Return the User object (null if no match found)
	}
	


	
}
