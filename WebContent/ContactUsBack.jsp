<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@include file="conn.jsp" %>
<%
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String phno=request.getParameter("phno");
	String msg=request.getParameter("msg");
	
	try
	{
		int id;
		
	    PreparedStatement ps1=con.prepareStatement("insert into contactus values(?,?,?,?,?)");
	    Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	    ResultSet rs=st.executeQuery("select * from contactus");
	    if(rs.last())
	    {
	    	 id=rs.getInt(1);
	 	     id++;
	    }
	    else
	    {
	    	id=1;
	    }
	   
	    ps1.setInt(1,id);
	    ps1.setString(2,name);
	    ps1.setString(3,email);
	    ps1.setString(4,phno);
	    ps1.setString(5,msg);
	    int result=ps1.executeUpdate();
	    if(result == 1)
	    {
	    	out.println("Enquiry Collected");
	    }
	}
	catch(Exception ex)
	{
		out.println(ex);
	}
	
%>