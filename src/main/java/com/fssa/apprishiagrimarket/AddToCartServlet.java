package com.fssa.apprishiagrimarket;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.rishi.model.Cart;
import com.fssa.rishi.model.Order;
import com.fssa.rishi.model.ProductDetails;
import com.fssa.rishi.services.CartService;
import com.fssa.rishi.services.OrderService;
import com.fssa.rishi.services.ProductService;
import com.fssa.rishi.services.UserService;
import com.fssa.rishi.services.exceptions.ServiceException;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userEmail = (String) session.getAttribute("loggedInEmail");
		UserService service = new UserService();
		try {
			long userId = service.findIdByEmail(userEmail);
			System.out.println(userId);
			long productId = Long.parseLong(request.getParameter("id"));
			long orderId = System.currentTimeMillis();

			ProductDetails products = ProductService.findProductById(productId);

			String name = products.getName();
			int price = products.getPrice();

			Cart cart = new Cart(orderId, userId, productId, name, price, 1);
			System.out.println("New order");

			CartService orderservice = new CartService();

			try {
				if (orderservice.createCart(cart)) {
					System.out.println("Register Product Successfully");
					response.sendRedirect("GetAllProductServlet");

				}
			} catch (Exception e) {
				response.sendRedirect(
						request.getContextPath() + "/GetAllProductServlet?errorMessage=" + e.getMessage());
			}
		} catch (ServiceException e) {
			response.sendRedirect(
					request.getContextPath() + "/pages/2.productDetails.jsp?errorMessage=" + e.getMessage());
		}
	}
}
