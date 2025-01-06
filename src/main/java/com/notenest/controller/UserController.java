package com.notenest.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notenest.dao.UserDAO2;

/**
 * Servlet implementation class UserController
 */
@WebServlet({"/editUser"})
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }


    // DoGet and DoPost methods to handle HTTP requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Code to show user profile or handle other GET requests
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String path = request.getServletPath();

    	switch (path) {
    	case "/editUser":
        editUser(request, response);
    	}
    }
    
    // Method to handle user edit requests
    protected void editUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve user details from the form
            String userIdParam = request.getParameter("userId");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String fullName = request.getParameter("fullName");
            

            // Validate inputs
            if (userIdParam == null || username == null || email == null || fullName == null ||
                userIdParam.isEmpty() || username.isEmpty() || email.isEmpty() || fullName.isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "All fields are required.");
                return;
            }

            int userId = Integer.parseInt(userIdParam);
            System.out.println(userIdParam + username + email + fullName);

            // Call the UserDAO to update the user details in the database
            UserDAO2 userDAO = new UserDAO2();
            boolean success = userDAO.editUser(userId, username, email, fullName);

            if (success) {
                response.getWriter().println("User updated successfully.");
                // Optionally redirect to a user profile page or the homepage
                response.sendRedirect("profile.jsp");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating user.");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user ID format.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while updating user.");
        }
    }
}
