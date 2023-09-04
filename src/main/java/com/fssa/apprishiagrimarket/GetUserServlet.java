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


/**
 * Servlet implementation class GetAllUserServlet
 */
@WebServlet("/GetUserServlet")
public class GetUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();

		List<User> users = new ArrayList<User> ();
		
		users.add(new User(1,"Bharath", "bharath@fssa.freshworks.com", "password123"));
		users.add(new User(2,"ram", "ram@fssa.freshworks.com", "ps322211"));
		users.add(new User(3,"Sridhivya", "sridhivya.freshworks.com", "sri@pass3"));
		
		
		
		// TODO set the list of users in the request scope and create a display_all_users.jsp file 
		// to print the details in HTML Tabular format. DO NOT print the passwords
		 for (User user : users) {
	            out.println("Name: " + user.getName() + ", Email: " + user.getEmailId());
	}

}
}



 class User {
	private int id;
	private String name;
	private String emailId;
	private String password;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public User(int id, String name, String emailId, String password) {
		this.id = id;
		this.name = name;
		this.emailId = emailId;
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", emailId=" + emailId + ", password=" + password + "]";
	} }
	
	


