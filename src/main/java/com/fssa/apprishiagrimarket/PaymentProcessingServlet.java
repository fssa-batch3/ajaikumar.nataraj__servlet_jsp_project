package com.fssa.apprishiagrimarket;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PaymentProcessingServlet
 */
@WebServlet("/PaymentProcessingServlet")
public class PaymentProcessingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

		String targetUrl = "/pages/successSeller.jsp";

		// Perform the redirection
		response.sendRedirect(request.getContextPath() + targetUrl);
	}

}
