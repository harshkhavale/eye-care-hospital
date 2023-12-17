package com.hospital.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.hospital.connection.DBCon;
import com.hospital.dao.UserDao;
import com.hospital.model.User;
@WebServlet("/userlogin")

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			try {
				UserDao udao = new UserDao(DBCon.getConnection());
				User user = udao.userLogin(email, password);

				if (user != null) {
					request.getSession().setAttribute("auth", user);
					if(user.getUsertype().equals("USER")) {
						response.sendRedirect("index.jsp");

					}
					else {
						response.sendRedirect("adddoc.jsp");

					}
				} else {
					out.print("user login failed!");

				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				out.print("user login failed!");

			}
		}
	}

}
