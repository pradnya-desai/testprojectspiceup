<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    <%@include file="conn.jsp" %>
    <%
    	String email=request.getParameter("email");
    	String password=request.getParameter("password1");
    	String confirmPassword=request.getParameter("password2");
    	try
    	{
    		if(password.equals(confirmPassword))
    		{
    			PreparedStatement ps1=con.prepareStatement("update login set password='"+password+"' where username='"+email+"'");
    			int n=ps1.executeUpdate();
    			if(n==1)
    				out.print("Password Changed");
    			else
    				out.print("Plzzz Enter Valid Details");
    		}
    		else
    		{
    			out.println("Password Doesn't Match");
    		}
    	}
    	catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    %>
