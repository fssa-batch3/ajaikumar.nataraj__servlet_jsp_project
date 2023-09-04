package com.fssa.apprishiagrimarket;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.rishi.model.ProductDetails;
import com.fssa.rishi.services.ProductService;
import com.fssa.rishi.utils.ConnectionUtil;

/**
 * Servlet implementation class RegisterProductServlet
 */
@WebServlet("/RegisterProductServlet")
public class RegisterProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doPost(req, resp);
//	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession(false);
		Connection connection = ConnectionUtil.getConnection();
		PrintWriter out = response.getWriter();

		try {
		    String userEmail = (String) session.getAttribute("loggedInEmail");
		    String sql = "SELECT id FROM user WHERE email = ?";
		    
		    PreparedStatement preparedStatement = connection.prepareStatement(sql);
		    preparedStatement.setString(1, userEmail);

		    ResultSet resultSet = preparedStatement.executeQuery();

		    String userID = null;
		    if (resultSet.next()) {
		        userID = resultSet.getString("id");
		    } else {
		        // Handle the case where no matching user was found
		        throw new Exception("User not found");
		    }

		    LocalDate uploadDate = LocalDate.now();
		    long uniqueID = System.currentTimeMillis();
		    long userId = Long.parseLong(userID);

		    String name = request.getParameter("name");
		    String productPrice = request.getParameter("price");
		    String productQty = request.getParameter("qty");
		    String description = request.getParameter("description");
		    String url = request.getParameter("url");
		    String address = request.getParameter("address");
		    String city = request.getParameter("city");
		    String type = request.getParameter("type");
		    String uploadPincode = request.getParameter("pincode");
		    
		    int price = Integer.parseInt(productPrice);
		    int qty = Integer.parseInt(productQty);
		    int pincode = Integer.parseInt(uploadPincode);

		    ProductDetails product = new ProductDetails(uniqueID, name, price, qty, description, null, address, type, city, userId, pincode, uploadDate);
		    ProductService productService = new ProductService();

		    try {
		        productService.registerProduct(product);
		        out.println("Register Product Successfully");
		        RequestDispatcher dispatcher = request.getRequestDispatcher("GetAllOwnProductsServlet");
		        dispatcher.forward(request, response);
		    } catch (Exception e) {
		        e.printStackTrace();  
		        out.println(e.getMessage());
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		    out.println("Error: " + e.getMessage());
		}
	}

	

}
