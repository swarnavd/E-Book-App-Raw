package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookAdd;
import com.entity.User;

public class Bookdaoimpl implements Bookdao{
	
	private Connection conn;
	@Override
	public List<BookAdd> showBookHome() {
		// TODO Auto-generated method stub
		String sql="select * from book where category=? and status=?";
		BookAdd b=null;
		List<BookAdd> list=new ArrayList();
		try {
			PreparedStatement st=conn.prepareStatement(sql);
			st.setString(1, "New");
			st.setString(2, "Active");
			
			ResultSet rs=st.executeQuery();
			int i=1;
			while(rs.next()&&i<=4) {
				b=new BookAdd();
				b.setId(rs.getInt("bookid"));
	            b.setName(rs.getString("name"));
	            b.setAuthorName(rs.getString("author"));
	            b.setPrice(rs.getString("price"));
	            b.setCategory(rs.getString("category"));
	            b.setStatus(rs.getString("status"));
	            b.setImage(rs.getString("image"));
	            b.setEmail(rs.getString("email"));
	            list.add(b);
			}
			
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}


	

	

	@Override
	public List<BookAdd> getRecentBook() {
		String sql="select * from book where status=? order by bookid desc";
		BookAdd b=null;
		List<BookAdd> list=new ArrayList();
		try {
			PreparedStatement st=conn.prepareStatement(sql);
			//st.setString(1, "New");
			st.setString(1, "Active");
			
			ResultSet rs=st.executeQuery();
			int i=1;
			while(rs.next()&&i<=4) {
				b=new BookAdd();
				b.setId(rs.getInt("bookid"));
	            b.setName(rs.getString("name"));
	            b.setAuthorName(rs.getString("author"));
	            b.setPrice(rs.getString("price"));
	            b.setCategory(rs.getString("category"));
	            b.setStatus(rs.getString("status"));
	            b.setImage(rs.getString("image"));
	            b.setEmail(rs.getString("email"));
	            list.add(b);
			}
			
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}






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

	        st.setString(1, b.getName());
	        st.setString(2, b.getAuthorName());
	        st.setString(3, b.getPrice());
	        st.setString(4, b.getCategory());
	        st.setString(5, b.getStatus());
	        st.setString(6, b.getImage());
	        st.setString(7, "admin@gmail.com");

	        int i = st.executeUpdate();
	       // System.out.println("Insert result: " + i);
	        if (i == 1) {
	            f = true;
	        }
	    } catch (SQLException e) {
	        System.out.println("SQL Exception: " + e.getMessage());
	        e.printStackTrace();
	    }
	    return f;
	}



	@Override
	public List<BookAdd> viewBook(BookAdd br) {
		// TODO Auto-generated method stub
		 	BookAdd b=null;
		    String sql = "SELECT * FROM book";
		    @SuppressWarnings("rawtypes")
			List<BookAdd> list=new ArrayList();
		    try {
		        // Prepare the SQL query
		        PreparedStatement st = conn.prepareStatement(sql);
		       
		        
		        // Execute the query
		        ResultSet rs = st.executeQuery();
		        
		        // Check if a result is returned
		        while (rs.next()) { // Move the cursor to the first row
		            b=new BookAdd();
		            b.setId(rs.getInt("bookid"));
		            b.setName(rs.getString("name"));
		            b.setAuthorName(rs.getString("author"));
		            b.setPrice(rs.getString("price"));
		            b.setCategory(rs.getString("category"));
		            b.setStatus(rs.getString("status"));
		            b.setImage(rs.getString("image"));
		            b.setEmail(rs.getString("email"));
		            list.add(b);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace(); // Print stack trace for debugging
		    }
		    
		return list;
		
	}



	@Override
	public void delBook(int id) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM book where bookid=?";
		try {
	        PreparedStatement st = conn.prepareStatement(sql);
	        st.setInt(1,id);
	        int i=st.executeUpdate();
	        
		}
		catch (SQLException e) {
	        e.printStackTrace(); // Print stack trace for debugging
	        System.out.println("SQL Exception: " + e.getMessage());
	    }
		
		
	}



	@Override
	public BookAdd editBook(int id) {
		// TODO Auto-generated method stub
		BookAdd b=new BookAdd();
		
		String sql = "SELECT * FROM book where bookid=?";
	    try {
	        // Prepare the SQL query
	        PreparedStatement st = conn.prepareStatement(sql);
	       st.setInt(1,id);
	        
	        // Execute the query
	        ResultSet rs = st.executeQuery();
	        System.out.println("Executing query: " + sql + " with id: " + id);
	        // Check if a result is returned
	        while(rs.next()) { // Move the cursor to the first row
	            b.setId(rs.getInt("bookid"));
	            b.setName(rs.getString("name"));
	            b.setAuthorName(rs.getString("author"));
	            b.setPrice(rs.getString("price"));
	            b.setCategory(rs.getString("category"));
	            b.setStatus(rs.getString("status"));
	            b.setImage(rs.getString("image"));
	            b.setEmail(rs.getString("email"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); // Print stack trace for debugging
	        System.out.println("SQL Exception: " + e.getMessage());
	    }
		
		return b;
	}
	
	
	public boolean updateBook(int id,String name,String author,String price,String category,String status,String image) {
		boolean f = false;
	    String sql = "update book set name=?,author=?,price=?,category=?,status=?,image=? where bookid=?";
	    
	    try {
	        PreparedStatement st = conn.prepareStatement(sql);

	        
	        st.setString(1, name);
	        st.setString(2, author);
	        st.setString(3, price);
	        st.setString(4, category);
	        st.setString(5, status);
	        st.setString(6, image);
	        st.setInt(7, id);

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






	@Override
	public List<BookAdd> allNewBook() {
		String sql="select * from book where category =? and status=? order by bookid desc";
		BookAdd b=null;
		List<BookAdd> list=new ArrayList();
		try {
			PreparedStatement st=conn.prepareStatement(sql);
			st.setString(1, "New");
			st.setString(2, "Active");
			
			ResultSet rs=st.executeQuery();
			
			while(rs.next()) {
				b=new BookAdd();
				b.setId(rs.getInt("bookid"));
	            b.setName(rs.getString("name"));
	            b.setAuthorName(rs.getString("author"));
	            b.setPrice(rs.getString("price"));
	            b.setCategory(rs.getString("category"));
	            b.setStatus(rs.getString("status"));
	            b.setImage(rs.getString("image"));
	            b.setEmail(rs.getString("email"));
	            list.add(b);
			}
			
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}






	@Override
	public List<BookAdd> allRecentBook() {
		String sql="select * from book where  status=? order by bookid desc";
		BookAdd b=null;
		List<BookAdd> list=new ArrayList();
		try {
			PreparedStatement st=conn.prepareStatement(sql);
			//st.setString(1, "New");
			st.setString(1, "Active");
			
			ResultSet rs=st.executeQuery();
			
			while(rs.next()) {
				b=new BookAdd();
				b.setId(rs.getInt("bookid"));
	            b.setName(rs.getString("name"));
	            b.setAuthorName(rs.getString("author"));
	            b.setPrice(rs.getString("price"));
	            b.setCategory(rs.getString("category"));
	            b.setStatus(rs.getString("status"));
	            b.setImage(rs.getString("image"));
	            b.setEmail(rs.getString("email"));
	            list.add(b);
			}
			
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}






	@Override
	public BookAdd viewDetails( int id) {
		BookAdd b=new BookAdd();
		
		String sql = "SELECT * FROM book where bookid=?";
	    try {
	        // Prepare the SQL query
	        PreparedStatement st = conn.prepareStatement(sql);
	       st.setInt(1,id);
	        
	        // Execute the query
	        ResultSet rs = st.executeQuery();
	        System.out.println("Executing query: " + sql + " with id: " + id);
	        // Check if a result is returned
	        while(rs.next()) { // Move the cursor to the first row
	            b.setId(rs.getInt("bookid"));
	            b.setName(rs.getString("name"));
	            b.setAuthorName(rs.getString("author"));
	            b.setPrice(rs.getString("price"));
	            b.setCategory(rs.getString("category"));
	            b.setStatus(rs.getString("status"));
	            b.setImage(rs.getString("image"));
	            b.setEmail(rs.getString("email"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); // Print stack trace for debugging
	        System.out.println("SQL Exception: " + e.getMessage());
	    }
		
		return b;
	}
	
	

}
