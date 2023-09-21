package com.fssa.apprishiagrimarket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.rishi.model.ProductDetails;
import com.fssa.rishi.services.ProductService;
import com.fssa.rishi.services.exceptions.ServiceException;

/**
 * Servlet implementation class productsDetailServlet
 */
@WebServlet("/productsDetailServlet")
public class productsDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Assuming you have a ProductService to fetch product details
        int productId = Integer.parseInt(request.getParameter("id"));
        ProductDetails product;
		try {
			product = ProductService.findProductById(productId);
			 request.setAttribute("product", product);
		        request.getRequestDispatcher("/product_details.jsp").forward(request, response);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

       
    }

}
