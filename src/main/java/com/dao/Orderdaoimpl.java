package com.dao;

import com.entity.OrderAdd;
import java.sql.*;

public class Orderdaoimpl implements Orderdao{
	private Connection con;
	
	public Orderdaoimpl(Connection con) {
		super();
		this.con = con;
	}
	@Override
	public boolean insertOrder(OrderAdd o) {
		// TODO Auto-generated method stub
		boolean f=false;
		String sql="insert into orderprod values(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement st;
		int i=0;
		try {
			st = con.prepareStatement(sql);
			st.setInt(1, o.getId());
			st.setInt(2, o.getOrderId());
			st.setString(3, o.getUserName());
			st.setString(4, o.getEmail());
			st.setString(5, o.getAddress());
			st.setString(6, o.getPhone());
			st.setString(7, o.getBookName());
			st.setString(8, o.getAuthor());
			st.setDouble(9, o.getPrice());
			st.setString(10, o.getPayment());
			i=st.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return f;
		
	}


	
	

}
