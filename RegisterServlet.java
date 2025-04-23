package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String password = req.getParameter("password");
			String check = req.getParameter("check");

//			System.out.println(name+" "+email+" "+phone+" "+password+" "+check);

			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			us.setPassword(password);

			HttpSession session = req.getSession();

			if (check != null) {

				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
//Start For AllReady Exist User,.....
				
				boolean f2 = dao.checkUser(email);
				if (f2) {

					boolean f = dao.userRegister(us);

					if (f) {
//					System.out.println("User Register Success...");
						session.setAttribute("SuccMsg", "Registration Successfully..");
						resp.sendRedirect("login.jsp");
					} else {
//					System.out.println("Something wrong on Server..");
						session.setAttribute("FailedMsg", "Something wrong on Server..");
						resp.sendRedirect("register.jsp");
					}

				} else {

					session.setAttribute("FailedMsg", "User Already Exist Try Another  Email id");
					resp.sendRedirect("register.jsp");
				}	
//End For AllReady Exist User,.....

			} else {
//			System.out.println("Please Check Agree & Terms Condition");
				session.setAttribute("FailedMsg", "Please Check Agree & Terms Condition");
				resp.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
