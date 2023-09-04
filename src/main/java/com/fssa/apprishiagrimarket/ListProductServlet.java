package com.fssa.apprishiagrimarket;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class GetAllBookServlet
 */
@WebServlet("/GetAllProductsServlet")
public class ListProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
			String loggedInEmail = (String) session.getAttribute("loggedInEmail");
			PrintWriter out = response.getWriter();
			if (loggedInEmail == null) {
				response.sendRedirect("login.html");
			} else {
				out.println("<h1>Printing all Products</h1>");
				out.println("<p>Logged In user: " + loggedInEmail + "</p>");
				out.println("<a href='login.html'>logout</a>");
//				response.sendRedirect("login.html");
			}
		}
	}

}
