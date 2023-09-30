package com.fssa.apprishiagrimarket;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.rishi.services.CartService;
import com.fssa.rishi.services.exceptions.ServiceException;

/**
 * Servlet implementation class CartUpdateServlet
 */
@WebServlet("/CartUpdateServlet")
public class CartUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int qty = Integer.parseInt(request.getParameter("quantity"));
			long productId = Long.parseLong(request.getParameter("productId"));
			System.out.println("Qty  " + qty);
			System.out.println("Id " + productId);

			PrintWriter out = response.getWriter();
			CartService service = new CartService();

			try {
				service.updateCart(productId, qty);
				response.sendRedirect("CartServlet");
			} catch (ServiceException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
			// Handle any exceptions as needed
		}
	}

}
