package com.fssa.apprishiagrimarket;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.fssa.rishi.model.ProductDetails;

/**
 * Servlet implementation class GetSingleProductDetail
 */
@WebServlet("/GetSingleProductDetail")
public class GetSingleProductDetail extends HttpServlet {
private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		ProductDetails product = new ProductDetails(1645787484789L , "Apple",20, 30, null);

		
		JSONObject accountJson = new JSONObject(product);
		PrintWriter out = response.getWriter();
		out.println(accountJson.toString());
		out.flush();
	}
}
