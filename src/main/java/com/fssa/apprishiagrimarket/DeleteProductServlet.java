package com.fssa.apprishiagrimarket;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.rishi.model.ProductDetails;
import com.fssa.rishi.services.ProductService;
import com.fssa.rishi.services.exceptions.ServiceException;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieve the product ID from the request parameter
		String productId = request.getParameter("id");
		System.out.print(productId);
		PrintWriter out = response.getWriter();

		long product_id = Long.parseLong(productId);


		try {
			ProductDetails user1 = new ProductDetails(product_id);

			ProductService productService = new ProductService();

			try {
				productService.deleteProduct(user1);
				response.sendRedirect("GetAllOwnProductsServlet");
			} catch (ServiceException e) {
				e.printStackTrace(); 
			}

		} catch (Exception e) {
			e.printStackTrace();
			out.println("Error: " + e.getMessage());
		}
	}
}
