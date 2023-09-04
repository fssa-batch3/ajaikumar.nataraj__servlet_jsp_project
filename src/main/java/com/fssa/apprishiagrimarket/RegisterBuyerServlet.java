package com.fssa.apprishiagrimarket;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.rishi.dao.UserDAO;
import com.fssa.rishi.model.Seller;
import com.fssa.rishi.model.User;
import com.fssa.rishi.services.SellerService;
import com.fssa.rishi.services.UserService;
import com.fssa.rishi.services.exceptions.ServiceException;

/**
 * Servlet implementation class RegisterSellerServlet
 */
@WebServlet("/RegisterBuyerServlet")
public class RegisterBuyerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String confirm_password = request.getParameter("conform_password");
		String address = request.getParameter("address");
		String phoneNumber = request.getParameter("phone_number");
		String Pincode = request.getParameter("pincode");

		int pincode = Integer.parseInt(Pincode);
		long phoneNo = Long.parseLong(phoneNumber);
		long uniqueID = System.currentTimeMillis();

		UserService userService = new UserService();
		User user1 = new User(email, name, password, phoneNo, "Erode", "TN",
				address, uniqueID, null, pincode, "Male", false, false);

		try {
			if (userService.registerUser(user1)) {
				out.println("Registration successful");
				RequestDispatcher dispatcher = request.getRequestDispatcher("GetAllProductsList.jsp");
				dispatcher.forward(request, response);
			} else {
				out.println("Registration failed");
//				RequestDispatcher dispatcher = request.getRequestDispatcher(".pages/1.buy.signin.html");
//				dispatcher.forward(request, response);
			}
		} catch (ServiceException e) {
			e.printStackTrace();
			out.println(e.getMessage());
		}

	}

}
