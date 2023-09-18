package com.fssa.apprishiagrimarket;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.rishi.model.Cart;
import com.fssa.rishi.model.ProductDetails;
import com.fssa.rishi.services.CartService;
import com.fssa.rishi.services.ProductService;
import com.fssa.rishi.services.UserService;
import com.fssa.rishi.services.exceptions.ServiceException;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        PrintWriter out = response.getWriter();
//        long productId = Long.parseLong(request.getParameter("id"));
//        try {
//            ProductDetails product = ProductService.findProductById(productId);
//
//            request.setAttribute("cartProduct", product);
//
//        } catch (ServiceException e) {
//            out.print(e.getMessage());
//        }
//    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// Get the product ID from the request (modify this based on your actual form)
			long productId = Long.parseLong(request.getParameter("id"));

			UserService service = new UserService();

			HttpSession session = request.getSession(false);
			String loggedInEmail = (String) session.getAttribute("loggedInEmail");
			long userId = service.findIdByEmail(loggedInEmail);

			CartService cartService = new CartService();
			boolean addedToCart = cartService.createCart(productId, userId);

			if (addedToCart) {
				// Redirect to a success page or display a success message
				response.sendRedirect("success.jsp");
			} else {
				// Redirect to an error page or display an error message
				response.sendRedirect("error.jsp");
			}
		} catch (ServiceException | NumberFormatException e) {
			// Handle the service exception (e.g., log it or show an error message)
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}
}
