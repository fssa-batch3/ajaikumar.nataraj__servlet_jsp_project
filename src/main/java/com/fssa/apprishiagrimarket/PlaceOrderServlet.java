package com.fssa.apprishiagrimarket;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.rishi.model.Cart;
import com.fssa.rishi.model.Order;
import com.fssa.rishi.services.CartService;
import com.fssa.rishi.services.OrderService;
import com.fssa.rishi.services.UserService;
import com.fssa.rishi.services.exceptions.ServiceException;

/**
 * Servlet implementation class PlaceOrderServlet
 */
@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
		CartService cartServcice = new CartService();
		OrderService orderService = new OrderService();
		long user_id = Long.parseLong(request.getParameter("id"));
		System.out.print("place order servlet "+user_id);
		try {
			// Retrieve cart items for the user
			List<Cart> cartItems = cartServcice.getCartByUserId(user_id);
			LocalDate orderDate = LocalDate.now();


			// Create OrderedDetail objects from cart items
			List<Order> orderedDetails = new ArrayList<>();
			for (Cart cartItem : cartItems) {
				Order orderedDetail = new Order(user_id, cartItem.getProductId(), cartItem.getName(), cartItem.getPrice(), cartItem.getQuantity(), orderDate);
				orderedDetail.setuser_id(user_id);
				orderedDetail.setproductId(cartItem.getProductId());
				orderedDetail.setName(cartItem.getName());
				orderedDetail.setPrice(cartItem.getPrice());
				orderedDetail.setQuantity(cartItem.getQuantity());
				orderedDetail.setordered_date(orderDate);

				orderedDetails.add(orderedDetail);
			}

			// Insert ordered details into the database
			boolean orderPlaced = orderService.createOrders(orderedDetails);

			if (orderPlaced) {
				// Optionally, you can clear the user's cart here
				cartServcice.deleteCartByUserId(user_id);
//				response.sendRedirect("CartBuyerDetail.jsp");
				
				response.sendRedirect(request.getContextPath() + "/CartBuyerDetailServlet");

			} else {
				response.sendRedirect("OrderFailure.jsp");
			}
		} catch (ServiceException e) {
			e.printStackTrace();
			response.sendRedirect("OrderFailure.jsp");
		}
	}
}
