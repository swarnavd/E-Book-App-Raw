package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.entity.BookAdd;

public class Bookdaoimpl implements Bookdao{
	private Connection conn;

	

	public Bookdaoimpl(Connection conn) {
		super();
		this.conn = conn;
	}



	@Override
	public boolean addBook(BookAdd b) {
		boolean f = false;
	    String sql = "insert into book(name, author, price, category, status, image, email) values(?,?,?,?,?,?,?)";
	    
	    try {
	        PreparedStatement st = conn.prepareStatement(sql);

	        // Debugging output to verify values
	        System.out.println("Preparing to insert:");
	        System.out.println("Name: " + b.getName());
	        System.out.println("Author: " + b.getAuthorName());
	        System.out.println("Price: " + b.getPrice());
	        System.out.println("Category: " + b.getCategory());
	        System.out.println("Status: " + b.getStatus());
	        System.out.println("Image: " + b.getImage());

	        st.setString(1, b.getName());
	        st.setString(2, b.getAuthorName());
	        st.setString(3, b.getPrice());
	        st.setString(4, b.getCategory());
	        st.setString(5, b.getStatus());
	        st.setString(6, b.getImage());
	        st.setString(7, "admin@gmail.com");

	        int i = st.executeUpdate();
	        System.out.println("Insert result: " + i);
	        if (i == 1) {
	            f = true;
	        }
	    } catch (SQLException e) {
	        System.out.println("SQL Exception: " + e.getMessage());
	        e.printStackTrace();
	    }
	    return f;
	}
	

}
