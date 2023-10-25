package com.fssa.apprishiagrimarket;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.time.LocalDate;
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
import com.fssa.rishi.utils.ConnectionUtil;

/**
 * Servlet implementation class RegisterProductServlet
 */
@WebServlet("/RegisterProductServlet")
public class RegisterProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		String userEmail = (String) session.getAttribute("loggedInEmail");

		UserService service = new UserService();
		try {
			long userId = service.findIdByEmail(userEmail);
			System.out.println(userId);
			request.setAttribute("userId", userId);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/10.upload.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			response.sendRedirect(request.getContextPath() + "/pages/10.upload.jsp?errorMessage=" + e.getMessage());

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		Connection connection = ConnectionUtil.getConnection();
		PrintWriter out = response.getWriter();

		try {
			UserService service = new UserService();
			String userEmail = (String) session.getAttribute("loggedInEmail");

			long userId = service.findIdByEmail(userEmail);
//			request.setAttribute("userId", userId);
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/10.upload.jsp");
//			dispatcher.forward(request, response);

			System.out.println(userId);
			LocalDate uploadDate = LocalDate.now();
			long uniqueID = System.currentTimeMillis();

			String name = request.getParameter("name");
			String productPrice = request.getParameter("price");
			String productQty = request.getParameter("qty");
			String description = request.getParameter("description");
			String url = request.getParameter("url");
			String address = request.getParameter("address");
			String district = request.getParameter("district");
			String type = request.getParameter("type");
			String uploadPincode = request.getParameter("pincode");

			int price = Integer.parseInt(productPrice);
			int qty = Integer.parseInt(productQty);
			int pincode = Integer.parseInt(uploadPincode);

			ProductDetails product = new ProductDetails(uniqueID, name, price, qty, description, url, address, type,
					district, userId, pincode, uploadDate);
			ProductService productService = new ProductService();

			List<ProductDetails> products = null;
			try {
				if (productService.registerProduct(product)) {
					out.println("Register Product Successfully");
					products = productService.readProductDetails();
					session.setAttribute("products", products);
					int amount = price * qty;
					response.sendRedirect(request.getContextPath() + "/pages/SellerPayment.jsp?amount=" + amount);
					//response.sendRedirect(request.getContextPath() + "/pages/successSeller.jsp");

				} else {
					out.println("register failed");
				}
			} catch (Exception e) {
				response.sendRedirect(request.getContextPath() + "/pages/10.upload.jsp?errorMessage=" + e.getMessage());
				System.out.println(e.getMessage());
			}
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath() + "/pages/10.upload.jsp?errorMessage=" + e.getMessage());
			System.out.println(e.getMessage());

		}
	}

}





