package com.fssa.apprishiagrimarket;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.rishi.model.User;
import com.fssa.rishi.services.UserService;
import com.fssa.rishi.services.exceptions.ServiceException;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/ProfileServlet")
public class RegisterUserUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		long userId = Long.parseLong(request.getParameter("id"));
		RequestDispatcher dispatcher = null;
		try {
			User user = UserService.findUserById(userId);

			request.setAttribute("user", user);

			dispatcher = request.getRequestDispatcher("/pages/profile.jsp");
			dispatcher.forward(request, response);

		} catch (ServiceException e) {
			out.print(e.getMessage());
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long userId = Long.parseLong(request.getParameter("id"));
		User updateUser = new User();
		updateUser.setId(userId);
		updateUser.setUsername(request.getParameter("username"));
		updateUser.setPhoneNo(Long.parseLong(request.getParameter("phone_number")));
		updateUser.setDistrict(request.getParameter("district"));
		updateUser.setAddress(request.getParameter("address"));
		updateUser.setDob(Date.valueOf(request.getParameter("dob")));
		updateUser.setPincode(Integer.parseInt(request.getParameter("pincode")));
		updateUser.setEmail(request.getParameter("email"));

		PrintWriter out = response.getWriter();

		UserService userService = new UserService();
		try {
			userService.updateUser(updateUser);
			// Set a success message in a request attribute
			request.setAttribute("successMessage", "Update successful");
			// Redirect back to the profile page with the user's updated data
			response.sendRedirect("ProfileServlet?id=" + userId);
		} catch (ServiceException e) {
			// Set an error message in a request attribute
			request.setAttribute("errorMessage", e.getMessage());
			// Redirect to the profile page with an error message as a query parameter
			response.sendRedirect(request.getContextPath() + "/ProfileServlet?errorMessage=" + e.getMessage());
		}

	}

}
