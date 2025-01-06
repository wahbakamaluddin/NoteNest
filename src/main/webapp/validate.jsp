<%@ page import="com.notenest.dao.UserDAO" %>
<%@ page import="com.notenest.bean.UserBean" %>
<%@ page import="com.notenest.util.DBUtil" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="java.sql.*" %>

<%
    JSONArray list = new JSONArray();
    PreparedStatement pst;
    
    try {
        // Create UserBean object
        UserBean user = new UserBean();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Instantiate the DAO
         
		UserDAO userDAO = new UserDAO(); // Pass connection to the DAO        
        
        // Get the user object from the DAO by username and password
        user = userDAO.checkLogin(username, password); 
        String msg;
        JSONObject obj = new JSONObject();
        HttpSession sess = request.getSession();
        
        // Check if the user exists
        if (user != null) {
            // Set session attributes
            int userId = userDAO.getUserIdByUsername(username); 
            sess.setAttribute("username", username);
            sess.setAttribute("userId", userId);

            // Prepare success message
            msg = "1"; // Login successful
            obj.put("msg", msg);
            list.add(obj);
        } else {
            // Prepare error message
            msg = "3"; // Username or password do not match
            obj.put("msg", msg);
            list.add(obj);
        }
        
        // Output the response as JSON
        out.println(list.toJSONString());
        out.flush();

    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
