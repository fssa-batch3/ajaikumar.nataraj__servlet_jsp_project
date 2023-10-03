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

import com.fssa.rishi.model.ProductDetails;
import com.fssa.rishi.model.User;

import com.fssa.rishi.services.ProductService;
import com.fssa.rishi.services.UserService;
import com.fssa.rishi.services.exceptions.ServiceException;

/**
 * Servlet implementation class productDetailServlet
 */
@WebServlet("/productDetailServlet")
public class productDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();
		long id = Long.parseLong(request.getParameter("id"));
		long sellerId = Long.parseLong(request.getParameter("userId"));
		System.out.println(id);
		ProductService service = new ProductService();
		UserService userService = new UserService();

		if (session != null) {
			String loggedInEmail = (String) session.getAttribute("loggedInEmail");

			if (loggedInEmail == null) {
				response.sendRedirect(request.getContextPath() + "/pages/2.Login.jsp");
			} else {
				try {
					ProductDetails products = service.findProductById(id);
					long userId = userService.findIdByEmail(loggedInEmail);

					User user = userService.findUserById(sellerId);
					System.out.println(products);
					request.setAttribute("products", products);
					request.setAttribute("user", user);
					request.setAttribute("id", userId);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/productDetail.jsp");
					dispatcher.forward(request, response);
				} catch (ServiceException e) {
					String errormsg = ("Error in getting the products: " + e.getMessage());
					out.print(errormsg);
				}
			}
		}
	}

}
