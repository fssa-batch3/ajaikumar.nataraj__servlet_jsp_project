package com.fssa.apprishiagrimarket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.rishi.dao.UserDAO;
import com.fssa.rishi.dao.exceptions.DAOException;

/**
 * Servlet implementation class LogoutServletSeller
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unused")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String email = (String) session.getAttribute("loggedInEmail");

		if (session != null) {
			session.removeAttribute("loggedInEmail");
			System.out.println("Existing Session ID:" + session.getId());

			// invalidate removes all the session attributes
			session.invalidate();

		} else {
			System.out.println("No Session Exists");
		}

		try {
		    int type = UserDAO.findTypeByEmail(email);
		        response.sendRedirect(request.getContextPath() + "/pages/2.buy-login.jsp");
		    
		} catch (DAOException e) {
		    // Handle the exception (e.g., log it or show an error message)
		    e.printStackTrace();
		}

		// Redirecting to login page since we have logged out
	}

}
