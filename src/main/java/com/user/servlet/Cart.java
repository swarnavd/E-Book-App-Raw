package com.user.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Bookdaoimpl;
import com.dao.Cartdaoimpl;
import com.db.DbConnect;
import com.entity.*;

/**
 * Servlet implementation class Cart
 */
@WebServlet("/Cart")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		CartAdd c=new CartAdd();
		int bid=Integer.parseInt(request.getParameter("bid"));
		String uid=request.getParameter("id");
		
		try {
			Bookdaoimpl ob=new Bookdaoimpl(DbConnect.getCon());
			BookAdd b=ob.viewDetails(bid);
			Cartdaoimpl ob1=new Cartdaoimpl(DbConnect.getCon());
			c.setBid(bid);
			c.setUid(uid);
			c.setBookname(b.getName());
			c.setAuthorname(b.getAuthorName());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotal_price(Double.parseDouble(b.getPrice()));
			boolean f=ob1.addCart(c);
			if(f) {
				response.sendRedirect("home.jsp");
			}
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
	}

	
}
