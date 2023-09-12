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

import com.fssa.rishi.model.ProductDetails;
import com.fssa.rishi.services.ProductService;
import com.fssa.rishi.services.UserService;
import com.fssa.rishi.services.exceptions.ServiceException;
/**
 * Servlet implementation class GetAllProductServlet
 */
@WebServlet("/GetAllProductServlet")
public class GetAllProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();
		UserService service = new UserService();


		if (session != null) {
			String loggedInEmail = (String) session.getAttribute("loggedInEmail");
			if (loggedInEmail == null) {
				response.sendRedirect("loginBuyer.jsp");
			} else {
				try {
					List<ProductDetails> products = new ProductService().readProductDetails();
					long id = service.findIdByEmail(loggedInEmail);
					System.out.println(products);
					request.setAttribute("PRODUCTS_LIST", products);
					request.setAttribute("userId", id);
					RequestDispatcher dispatcher = request.getRequestDispatcher("GetAllProductsList.jsp");
					dispatcher.forward(request, response);
				} catch (ServiceException e) {
					String errormsg = ("Error in getting the products: " + e.getMessage());
					out.print(errormsg);
				}
			}
		}
	}


}
