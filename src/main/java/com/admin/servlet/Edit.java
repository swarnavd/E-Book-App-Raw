package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.Bookdaoimpl;
import com.db.DbConnect;
import com.entity.BookAdd;

/**
 * Servlet implementation class Edit
 */
@WebServlet("/Edit")
@MultipartConfig
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Edit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idp=request.getParameter("idp");
		System.out.println("idp: " + idp);  // Debugging line
		  // To see the output in the browser
		int id=Integer.parseInt(idp);
		String name=request.getParameter("bname");
		
		String author=request.getParameter("aname");
		String price=request.getParameter("price");
		String category=request.getParameter("category");
		String status=request.getParameter("status");
		Part part=request.getPart("file");
		String fileName=part.getSubmittedFileName();
		BookAdd bo=new BookAdd();
		bo.setName(name);
		bo.setAuthorName(author);
		bo.setPrice(price);
		bo.setCategory(category);
		bo.setStatus(status);
		bo.setImage(fileName);
		HttpSession session=request.getSession();
		boolean f=false;
		try {
			Bookdaoimpl ob=new Bookdaoimpl(DbConnect.getCon());
			BookAdd b=ob.editBook(id);
			if(b!=null){
				 f=ob.updateBook(id, name, author, price, category, status, fileName);
			}
			
			if(f) {
				String path=getServletContext().getRealPath("")+"book";
				File fi=new File(path);
				part.write(path+File.separator+fileName);
				
				//session.setAttribute("message", "Book added Succesfully!!!");
				response.sendRedirect("./admin/viewbook.jsp");
			}
			else {
				session.setAttribute("message", "Book not updated!!!");
				//response.sendRedirect("./admin/edit.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.getWriter().println(e);
			e.printStackTrace();
		}
	
	}

}
