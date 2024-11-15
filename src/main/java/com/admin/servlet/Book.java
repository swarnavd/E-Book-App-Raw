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
 * Servlet implementation class Book
 */
@WebServlet("/Book")
@MultipartConfig
public class Book extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Book() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("bname");
		String author=request.getParameter("aname");
		String price=request.getParameter("price");
		String category=request.getParameter("category");
		String status=request.getParameter("status");
		Part part=request.getPart("file");
		String fileName=part.getSubmittedFileName();
//		String image=request.getParameter("image");
		
		BookAdd bo=new BookAdd();
		bo.setName(name);
		bo.setAuthorName(author);
		bo.setPrice(price);
		bo.setCategory(category);
		bo.setStatus(status);
		bo.setImage(fileName);
		HttpSession session=request.getSession();
		
		try {
			Bookdaoimpl ob=new Bookdaoimpl(DbConnect.getCon());
			boolean f=ob.addBook(bo);
			if(f) {
				String path=getServletContext().getRealPath("")+"book";
				File fi=new File(path);
				part.write(path+File.separator+fileName);
				
				session.setAttribute("message", "Book added Succesfully!!!");
				response.sendRedirect("./admin/addbook.jsp");
			}
			else {
				response.getWriter().println("Eror");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
