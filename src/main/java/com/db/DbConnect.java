package com.db;
import java.sql.*;
public class DbConnect {
	private static Connection con;
	private static String url="jdbc:mysql://localhost:3306/ebook";
	private static String user="swarnav";
	private static String password="swarnav";
	
	public static Connection getCon() throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con = DriverManager.getConnection(url,user,password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
}
