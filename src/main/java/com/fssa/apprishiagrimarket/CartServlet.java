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
import com.fssa.rishi.services.CartService;
import com.fssa.rishi.services.OrderService;
import com.fssa.rishi.services.UserService;
import com.fssa.rishi.services.exceptions.ServiceException;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();
		List<Cart> products = null;
		CartService Service = new CartService();
		UserService service = new UserService();

		if (session != null) {
			String loggedInEmail = (String) session.getAttribute("loggedInEmail");

			if (loggedInEmail == null) {
				response.sendRedirect(request.getContextPath() + "/pages/2.Login.jsp");
			} else {
				try {
					long id = service.findIdByEmail(loggedInEmail);
					System.out.println(id);

					products = Service.getCartByUserId(id);
					request.setAttribute("products", products);
					request.setAttribute("userId", id);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/2.CartHistory.jsp");
					dispatcher.forward(request, response);
				} catch (ServiceException e) {
					try {
						long id = service.findIdByEmail(loggedInEmail);
						request.setAttribute("userId", id);
						String errormsg = "Error in getting the products: " + e.getMessage();
						request.setAttribute("errorMessage", errormsg);

						// Forward the request to the error page
						RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/2.CartHistory.jsp");
						dispatcher.forward(request, response);
					} catch (Exception ex) {
						// Handle any exceptions that might occur during the forwarding
						ex.printStackTrace();
						// You can also consider redirecting to a generic error page here
					}
				}

			}
		}
	}
	
	

	  
}
