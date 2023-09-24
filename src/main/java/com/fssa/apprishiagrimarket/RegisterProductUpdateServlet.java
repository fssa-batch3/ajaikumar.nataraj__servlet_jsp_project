package com.fssa.apprishiagrimarket;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
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
 * Servlet implementation class RegisterProductUpdateAndDelete
 */
@WebServlet("/RegisterProductUpdate")
public class RegisterProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userEmail = (String) session.getAttribute("loggedInEmail");
		UserService service = new UserService();
		PrintWriter out = response.getWriter();
		long productId = Long.parseLong(request.getParameter("id"));
		RequestDispatcher patcher = null;
		try {
			long userId = service.findIdByEmail(userEmail);
			System.out.println(userId);
			request.setAttribute("userId", userId);
			ProductDetails product = ProductService.findProductById(productId);

			request.setAttribute("updateProduct", product);

			patcher = request.getRequestDispatcher("/pages/10.history.jsp");
			patcher.forward(request, response);

		} catch (ServiceException e) {
			response.sendRedirect(request.getContextPath() + "/pages/10.history.jsp?errorMessage=" + e.getMessage());
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long productId = Long.parseLong(request.getParameter("id"));
		ProductDetails updateProduct = new ProductDetails();
		updateProduct.setUrl(request.getParameter("url"));
		updateProduct.setName(request.getParameter("name"));
		updateProduct.setType(request.getParameter("type"));
		updateProduct.setDescription(request.getParameter("description"));
		updateProduct.setPrice(Integer.parseInt(request.getParameter("price")));
		updateProduct.setQuantity(Integer.parseInt(request.getParameter("qty")));
		updateProduct.setPincode(Integer.parseInt(request.getParameter("pincode")));
		updateProduct.setAddress(request.getParameter("address"));
		updateProduct.setId(productId);
		updateProduct.setDistrict(request.getParameter("district"));
		
		PrintWriter out = response.getWriter();
	
		ProductService service = new ProductService();
		UserService userservice = new UserService();

		try {

			service.updateProduct(updateProduct);
			HttpSession session = request.getSession();
			String userEmail = (String) session.getAttribute("loggedInEmail");
			long userId = userservice.findIdByEmail(userEmail);
			System.out.println(userId);
			response.sendRedirect("GetAllOwnProductsServlet");
		} catch (ServiceException e) {
			response.sendRedirect(request.getContextPath() + "/RegisterProductUpdate?id=" + productId + "&errorMessage=" + e.getMessage());
		}

	}

}
