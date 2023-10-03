package com.fssa.apprishiagrimarket;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.rishi.model.Order;
import com.fssa.rishi.model.User;
import com.fssa.rishi.services.OrderService;
import com.fssa.rishi.services.UserService;
import com.fssa.rishi.services.exceptions.ServiceException;

/**
 * Servlet implementation class CartBuyerDetailServlet
 */
@WebServlet("/CartBuyerDetailServlet")
public class CartBuyerDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userEmail = (String) session.getAttribute("loggedInEmail");
		UserService service = new UserService();

		PrintWriter out = response.getWriter();
		try {
			long userId = service.findIdByEmail(userEmail);
			System.out.println(userId);
			User user = service.findUserById(userId);
			request.setAttribute("User", user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/CartBuyerDetail.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			// Set the error message as a request attribute
			request.setAttribute("errorMessage", e.getMessage());

			// Forward to an error page
			// dispatcher = request.getRequestDispatcher("/pages/error.jsp");
			// dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userEmail = (String) session.getAttribute("loggedInEmail");
		UserService service = new UserService();
		try {
			long userId = service.findIdByEmail(userEmail);
			LocalDate orderDate = LocalDate.now();

			String address = request.getParameter("address");
			String district = request.getParameter("district");
			int pincode = Integer.parseInt(request.getParameter("pincode"));
			long phone_number = Long.parseLong(request.getParameter("phone_number"));

			Order order = new Order(userId, address, district, pincode, phone_number, orderDate);
			System.out.println("cartbuyerdetailservlet : "+order);

			OrderService orderservice = new OrderService();

			try {
				orderservice.updateUserDetailInOrder(order);
				System.out.println("Register Product Successfully");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/success.jsp");
				dispatcher.forward(request, response);
				// response.sendRedirect(request.getContextPath() + "/pages/BuyerPayment.jsp");

			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (

		ServiceException e) {
			e.printStackTrace();
		}
	}
}
