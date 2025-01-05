<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="com.notenest.bean.UserBean" %>
<%@ page import="com.notenest.dao.UserDAO" %>
<%@ page import="com.notenest.util.DBUtil" %>
<%@ page import="java.sql.*" %>

<%
    // Create JSON response array
    JSONArray list = new JSONArray();

    // Create UserBean object and set its properties from the form parameters
    UserBean user = new UserBean();
    user.setFullName(request.getParameter("fullName"));  // Assuming 'fname' in form corresponds to full name in UserBean
    user.setUsername(request.getParameter("username"));  // 'uname' for the username
    user.setEmail(request.getParameter("email"));
    user.setPassword(request.getParameter("password"));  // 'password' for user password
   	

    // Instantiate UsersDAO to interact with the database
    Connection con =  DBUtil.getConnection();
    UserDAO userDAO = new UserDAO(con);
    JSONObject obj = new JSONObject();

    try {
        // Call insertUser method from DAO to add user into the database
        user = userDAO.insertUser(user);

        // Success message to send back to the frontend
        obj.put("name", "success");
        list.add(obj);

        // Convert list to JSON and send as response
        out.println(list.toJSONString());
        out.flush();

    } catch (SQLException ex) {
        // Handle SQL exceptions
        ex.printStackTrace();
        obj.put("error", "SQL error: " + ex.getMessage());
        list.add(obj);
        out.println(list.toJSONString());
        out.flush();
    } catch (ClassNotFoundException ex) {
        // Handle ClassNotFound exceptions
        ex.printStackTrace();
        obj.put("error", "Class not found: " + ex.getMessage());
        list.add(obj);
        out.println(list.toJSONString());
        out.flush();
    }
%>
