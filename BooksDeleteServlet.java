package com.admin.servlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class BooksDeleteServlet extends HttpServlet{
	
	 @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		 try {
			 int id = Integer.parseInt(req.getParameter("id"));
			 
			 BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			 boolean f = dao.deletebooks(id);
			 
			 HttpSession session = req.getSession();
			 
			 if(f) {
				 
				 session.setAttribute("succMsg", "Book Delete Successfully..");
				 resp.sendRedirect("Admin/All_books.jsp");
			 }else {
				 session.setAttribute("failedMsg", "Something wrong on server..");
				 resp.sendRedirect("Admin/All_books.jsp");
			 }
			
		} catch (Exception e) {
			 e.printStackTrace(); 
		}
	}

}
