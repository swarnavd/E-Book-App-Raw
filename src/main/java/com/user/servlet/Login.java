package com.user.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Userdao;
import com.dao.Userdaoimpl;
import com.db.DbConnect;
import com.entity.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		if("admin@gmail.com".equals(email)&&"admin".equals(password)) {
			HttpSession session=request.getSession();
			session.setAttribute("user", "admin@gmail.com");
			response.sendRedirect("admin/admin.jsp");
		}
		else {
			try {
				Userdaoimpl ob=new Userdaoimpl(DbConnect.getCon());
				
				User us=ob.login(email, password);
//				us.getName();
//				us.getEmail();
//				us.getPassword();
//				us.getPhone();
				
				
				
				if(us==null) {
					
					RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
					request.setAttribute("message", "Invalid Credentials!!");
					rd.forward(request, response);
//					response.sendRedirect("login.jsp");
				}
				else {
					HttpSession session=request.getSession();
					session.setAttribute("ob", us);
//					response.getWriter().println("hurray");
					response.sendRedirect("home.jsp");
				}
			} 
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
		}
	}

}
