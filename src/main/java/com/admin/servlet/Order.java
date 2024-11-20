package com.admin.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Bookdaoimpl;
import com.dao.Cartdaoimpl;
import com.dao.Orderdaoimpl;
import com.db.DbConnect;
import com.entity.CartAdd;
import com.entity.OrderAdd;

/**
 * Servlet implementation class Order
 */
@WebServlet("/Order")
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Order() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("id"));
		String user=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String pin=request.getParameter("pincode");
		String address=request.getParameter("address");
		String method=request.getParameter("method");
		String landmark=request.getParameter("land");
		String full_adr=address+","+landmark+","+city+","+state+","+pin;
		String books="";
		double tot=0;
		try {
			Cartdaoimpl ob=new Cartdaoimpl(DbConnect.getCon());
			List<CartAdd> list=ob.viewMyCart(email);
			for(CartAdd c:list) {
				if(books!= null) {
					books=books+c.getBookname();
					tot=tot+c.getPrice();
				}
				else {
					books=books+","+c.getBookname();
					tot=tot+c.getPrice();
				}
				
			}
			Orderdaoimpl o=new Orderdaoimpl(DbConnect.getCon());
			OrderAdd or=new OrderAdd();
			or.setId(id);
			or.setUserName(user);
			or.setEmail(email);
			or.setPhone(phone);
			or.setAddress(full_adr);
			or.setPayment(method);
			or.setPrice(tot);
			or.setBookName(books);
			
			boolean f=o.insertOrder(or);
			if(f) {
				System.out.println("yah");
				response.sendRedirect("home.jsp");
			}
			else {
				System.out.println("yaak");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
			e.printStackTrace();
		}
	}

}
