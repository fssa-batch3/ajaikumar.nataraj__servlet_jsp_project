package com.fssa.apprishiagrimarket;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.rishi.model.ProductDetails;
import com.fssa.rishi.services.ProductService;
import com.fssa.rishi.utils.ConnectionUtil;

/**
 * Servlet implementation class RegisterProductUpdateAndDelete
 */
@WebServlet("/RegisterProductUpdate")
public class RegisterProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String productId = request.getParameter("id");

		long id = Long.parseLong(productId);
		System.out.print(id);

		String name = request.getParameter("name");
		String productPrice = request.getParameter("price");
		String productQty = request.getParameter("quantity");
		String description = request.getParameter("description");

		int price = Integer.parseInt(productPrice);
		int qty = Integer.parseInt(productQty);

		ProductDetails product = new ProductDetails(id, name, price, qty, description);
		ProductService productService = new ProductService();

		try {
		    Connection connection = ConnectionUtil.getConnection();

		    String updateQuery = "UPDATE product_details SET name = ?, price = ?, quantity = ?, description = ? WHERE id = ?";
		    PreparedStatement statement = connection.prepareStatement(updateQuery);
		    statement.setLong(1, id);
		    statement.setString(2, name);
		    statement.setInt(3, price);
		    statement.setInt(4, qty);
		    statement.setString(5, description);

		    // Execute the query
		    int rows = statement.executeUpdate();

		    statement.close();
		    connection.close();

		    response.sendRedirect("GetAllOwnProductsServlet");
		    return;
		} catch (SQLException e) {
		    e.printStackTrace();
		    // Handle database errors
		}


	}

}
