package com.fssa.apprishiagrimarket;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.rishi.services.OrderService;

/**
 * Servlet implementation class NotificationRejectServlet
 */
@WebServlet("/NotificationReject")
public class NotificationRejectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long id = Long.parseLong(request.getParameter("id"));
		long userId = Long.parseLong(request.getParameter("userId"));
		OrderService Service = new OrderService();

		try {
			Service.notificationReject(id);
			request.setAttribute("userId", userId);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/sellerNotificationServlet");
			dispatcher.forward(request, response);

		} catch (Exception e) {
			System.out.print("accept servlet ");
			e.getMessage();
		}
	}

}
