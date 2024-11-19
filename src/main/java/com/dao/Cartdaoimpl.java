
package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookAdd;
import com.entity.CartAdd;
import com.entity.User;

public class Cartdaoimpl implements Cartdao{
	private Connection con;
	
	public Cartdaoimpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public boolean addCart(CartAdd c) {
		boolean f = false;
	    String sql = "insert into cart(bid, uid, bookname, authorname, price, total_price) values(?,?,?,?,?,?)";
	    
	    try {
	        PreparedStatement st = con.prepareStatement(sql);


	        st.setInt(1, c.getBid());
	        st.setString(2, c.getUid());
	        st.setString(3, c.getBookname());
	        st.setString(4, c.getAuthorname());
	        st.setDouble(5, c.getPrice());
	        st.setDouble(6, c.getTotal_price());
	       
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
	public List<CartAdd> viewMyCart(String ob) {
		String sql="select * from cart where uid=?";
		CartAdd c=null;
		List<CartAdd> list=new ArrayList();
		try {
			double total_price=0;
			PreparedStatement st=con.prepareStatement(sql);
			//st.setString(1, "New");
			st.setString(1, ob);
			
			ResultSet rs=st.executeQuery();
			
			while(rs.next()) {
				c=new CartAdd();
				c.setBid(rs.getInt("bid"));
				c.setUid(rs.getString("uid"));
				c.setBookname(rs.getString("bookname"));
				c.setAuthorname(rs.getString("authorname"));
				c.setPrice(rs.getDouble("price"));
				total_price=total_price+rs.getDouble("price");
				c.setTotal_price(total_price);
	            list.add(c);
			}
			
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
		}
		return list;
	}
	
	public void delCart(int id) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM cart where bid=?";
		try {
	        PreparedStatement st = con.prepareStatement(sql);
	        st.setInt(1,id);
	        int i=st.executeUpdate();
	        
		}
		catch (SQLException e) {
	        e.printStackTrace(); // Print stack trace for debugging
	        System.out.println("SQL Exception: " + e.getMessage());
	    }
		
		
	}

}
