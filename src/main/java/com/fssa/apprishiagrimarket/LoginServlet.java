package com.fssa.apprishiagrimarket;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.rishi.dao.UserDAO;
import com.fssa.rishi.dao.exceptions.DAOException;
import com.fssa.rishi.model.User;
import com.fssa.rishi.services.SellerService;
import com.fssa.rishi.services.UserService;
import com.fssa.rishi.services.exceptions.ServiceException;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user = new User(email, password);

		PrintWriter out = response.getWriter();

		SellerService sellerService = new SellerService();
		UserService userService = new UserService();
		try {
			if (sellerService.logInUser(user)) {
				out.println("Login Successfull...");
				HttpSession session = request.getSession();
				
				session.setAttribute("loggedInEmail", email);
				long id = userService.findIdByEmail(email);
				session.setAttribute("sellerId", id);
					int type = UserDAO.findTypeByEmail(email);

					if (type == 1) {
						response.sendRedirect(request.getContextPath() + "/pages/10.upload.jsp");
					} else if (type == 0) {
						response.sendRedirect("GetAllProductServlet");
					}

			}

			else {
				out.println("Invalid Login Credentials");
				response.sendRedirect(
						request.getContextPath() + "/pages/2.buy-login.jsp?errorMessage=Password");

			}
		} catch (ServiceException | DAOException e) {
			response.sendRedirect(request.getContextPath() + "/pages/2.buy-login.jsp?errorMessage=" + e.getMessage());


//			RequestDispatcher dispatcher = request.getRequestDispatcher(
//					request.getContextPath() + "/pages/2.buy-login.jsp?ErrorMessage=Invalid Email");
//			dispatcher.forward(request, response);
		}

	}

}
