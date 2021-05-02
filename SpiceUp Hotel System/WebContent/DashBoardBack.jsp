<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="conn.jsp" %>
<html>
<body>
<%
	String input=request.getParameter("input");
	
	try
	{
		Statement st=con.createStatement();
		ResultSet rs;
		
		rs=st.executeQuery("select * from contactus where name='"+input+"'");
		%>
		<table border=1>
		<tr><th>Employee ID</th><th>Name</th><th>Email</th><th>Phone Number</th><th>Messege</th></tr>
		<% 
		while(rs.next())
		{
			%>
			<tr><td><%=rs.getInt(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td></tr>
			<% 
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>
</table>
</body>
</html>