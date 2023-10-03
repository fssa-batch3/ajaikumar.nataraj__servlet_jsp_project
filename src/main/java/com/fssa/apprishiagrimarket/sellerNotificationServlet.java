package com.fssa.apprishiagrimarket;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.rishi.model.Order;
import com.fssa.rishi.services.OrderService;
import com.fssa.rishi.services.exceptions.ServiceException;

/**
 * Servlet implementation class sellerNotificationServlet
 */
@WebServlet("/sellerNotificationServlet")
public class sellerNotificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();
		long id = Long.parseLong(request.getParameter("id"));
		System.out.println(id);
		List<Order> products = null;
		OrderService service = new OrderService();

		if (session != null) {
			String loggedInEmail = (String) session.getAttribute("loggedInEmail");

			if (loggedInEmail == null) {
				response.sendRedirect(request.getContextPath() + "/pages/2.Login.jsp");
			} else {
				try {

				    products = service.getOrdersByUserIdForNotification(id);
					System.out.println(products);
					request.setAttribute("products", products);
					request.setAttribute("userId", id);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/11.place-products.jsp");
					dispatcher.forward(request, response);
				} catch (ServiceException e) {
					String errormsg = ("Error in getting the products: " + e.getMessage());
					out.print(errormsg);
				}
			}
		}
		
	}

}
