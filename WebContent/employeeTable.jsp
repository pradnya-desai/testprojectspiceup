<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@include file="conn.jsp"%>

<%
	try {
		Statement st = con.createStatement(
				ResultSet.TYPE_SCROLL_SENSITIVE,
				ResultSet.CONCUR_UPDATABLE);
		ResultSet rs = st.executeQuery("select * from Employee");
%>
<table border="" class="table table-striped">
	<tr>
		<th>Employee ID</th>
		<th>Name</th>
		<th>Address</th>
		<th>Email ID</th>
		<th>Phone Number</th>
		<th>Age</th>
		<th>Aadhar Card</th>
		<th>Designation</th>
		<th colspan=2>Action</th>



	</tr>

	<%
		while (rs.next()) {
				int EmployeeId = rs.getInt(1);
	%>
		<tr>
				<td><%=rs.getInt(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getInt(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%></td>
				
				<td><a href='Update.jsp?id=<%=rs.getString("id")%>'><input type=button class="btn btn-warning" value="Update"></button></a></td>
					
				<!--<td> <input type="button" value="Update"
				onclick="UpdateEmp(<%=EmployeeId%>)"></td>-->
				
				<td><input type="button" class="btn btn-danger" value="Delete" onclick="Delete(<%=EmployeeId%>)" ></td>	
		</tr>

		<%
			}
		}	 
		catch (Exception e) 
		{
				e.printStackTrace();
			}
		%>

