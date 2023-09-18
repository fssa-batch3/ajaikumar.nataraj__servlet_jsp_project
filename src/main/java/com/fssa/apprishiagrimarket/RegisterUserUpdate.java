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
		        updateUser.setPassword(request.getParameter("password"));		        
		        updateUser.setPhoneNo(Long.parseLong(request.getParameter("phoneNo")));
		        updateUser.setDistrict(request.getParameter("district"));
		        updateUser.setAddress(request.getParameter("address"));
		        updateUser.setDob(Date.valueOf(request.getParameter("dob")));
		        updateUser.setPincode(Integer.parseInt(request.getParameter("pincode")));
		        updateUser.setEmail(request.getParameter("email"));

		        PrintWriter out = response.getWriter();

		        UserService userService = new UserService();
		        try {
		            userService.updateUser(updateUser);
		            // Redirect back to the profile page with the user's updated data
		            response.sendRedirect("ProfileServlet?id=" + userId);
		        } catch (ServiceException e) {
		            out.println(e.getMessage());
		        }
		    }
		
	}

