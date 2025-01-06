<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    // Invalidate the session if it exists
    session = request.getSession(false);  
    if (session != null) {
        session.invalidate();
    }

    // Redirect to the homepage (index.jsp)
    response.sendRedirect("index.jsp");
%>
