package com.user.servlet;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Userdaoimpl;
import com.db.DbConnect;
import com.entity.User;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String phone=request.getParameter("phone");
		String check=request.getParameter("check");
		User us=new User();
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);
		us.setPhone(phone);
		HttpSession session=request.getSession();
		if(check!=null) {
			try {
				Userdaoimpl ob=new Userdaoimpl(DbConnect.getCon());
				boolean f=ob.userRegistre(us);
				if(f) {
					session.setAttribute("message", "User registered successfully!!");
					response.sendRedirect("register.jsp");
				}
				else {
					session.setAttribute("errormessage", "Something Error on server!!");
					response.sendRedirect("register.jsp");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.getWriter().println("Error");
			}
		}
		else {
			session.setAttribute("errormessage", "Please agree with the terms and condition!!");
			response.sendRedirect("register.jsp");
		}
		
	}

}
