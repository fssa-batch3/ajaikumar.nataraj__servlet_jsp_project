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
import com.fssa.rishi.model.ProductDetails;
import com.fssa.rishi.services.OrderService;
import com.fssa.rishi.services.ProductService;
import com.fssa.rishi.services.UserService;
import com.fssa.rishi.services.exceptions.ServiceException;

/**
 * Servlet implementation class BuyNowServlet
 */
@WebServlet("/BuyNowServlet")
public class BuyNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userEmail = (String) session.getAttribute("loggedInEmail");
		UserService service = new UserService();

		PrintWriter out = response.getWriter();
		long productId = Long.parseLong(request.getParameter("id"));
		try {
			long userId = service.findIdByEmail(userEmail);
			System.out.println(userId);
			request.setAttribute("userId", userId);
			System.out.print(productId);
			ProductDetails product = ProductService.findProductById(productId);
			System.out.print(product);
			request.setAttribute("Product", product);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/detail.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			// Set the error message as a request attribute
			request.setAttribute("errorMessage", e.getMessage());

			// Forward to an error page
			// dispatcher = request.getRequestDispatcher("/pages/error.jsp");
			// dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userEmail = (String) session.getAttribute("loggedInEmail");
		UserService service = new UserService();
		try {
			long userId = service.findIdByEmail(userEmail);

			long productId = Long.parseLong(request.getParameter("productId"));
			LocalDate uploadDate = LocalDate.now();
			long orderId = System.currentTimeMillis();

			String name = request.getParameter("name");
			int price = Integer.parseInt(request.getParameter("price"));
			System.out.println(price);
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			String address = request.getParameter("address");
			String district = request.getParameter("district");
			long phone = Long.parseLong(request.getParameter("phone"));
			int pincode = Integer.parseInt(request.getParameter("pincode"));

			Order order = new Order(orderId, userId, productId, name, price, quantity, address, district, pincode,
					uploadDate);
			System.out.println(order);

			OrderService orderservice = new OrderService();
			User user = UserService.findUserById(userId);
			System.out.println("Check user in servlet " + user);

//			List<Order> orders = null;
			try {
				if (orderservice.createOrder(order)) {
					request.setAttribute("user", user);

					System.out.println("Register Product Successfully");
					RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/BuyerPayment.jsp");
					dispatcher.forward(request, response);
					// response.sendRedirect(request.getContextPath() + "/pages/BuyerPayment.jsp");

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}
}
