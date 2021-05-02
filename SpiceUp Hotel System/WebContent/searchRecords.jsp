<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@include file="conn.jsp"%>

<%
	String inputData = request.getParameter("inputData");
	//out.println(inputData);
	int choice= Integer.parseInt(request.getParameter("choice"));
	String name = request.getParameter("name");
	String phno = request.getParameter("phno");
	String email = request.getParameter("email");
	String msg = request.getParameter("msg");

	try 
	{
		Statement st = con.createStatement();
		ResultSet rs;
		String query =null;
		if(choice==1)
		{
			 query="select * from contactus where name like '%"+ inputData+ "%' or email like '%"+ inputData+ "%' or phno like '%"+ inputData+ "%' or messege like '%" + inputData + "%'";
		
		rs = st.executeQuery(query);
%>
		<table border="" class="table table-striped">
			<tr>
				<th>Enquiry ID</th>
				<th>Customer Name</th>
				<th>Email ID</th>
				<th>Phone Number</th>
				<th>Messege</th>
			</tr>
<%
			while (rs.next()) 
			{
%>
			<tr>
				<td><%=rs.getInt(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
			</tr>

<%
			}
%>
		</table>
<%	}
		if(choice == 3)
		{
			//query=" select * from booktablee where name like '%"+ inputData+ "%' or email like '%"+ inputData+ "%' or phno like '%"+ inputData+ "%' or noofpeople like '%"+ inputData+ "%' or tarikh like '%"+ inputData+ "%' or vel like '%"+ inputData+ "%' or msg like '%" + inputData + "%'";
			query="select * from register where rid like '%"+ inputData+ "%' or rname like '%"+ inputData+ "%' or email like '%"+ inputData+ "%'";
		
			rs = st.executeQuery(query);
%>
		<table border="" class="table table-striped">
			<tr>
				<th> ID</th>
				<th>Customer Name</th>
				<th>Email ID</th>
			</tr>
<%				
				
				
					while (rs.next()) 
				{
%>
					<tr>
						<td><%=rs.getInt(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(3)%></td>
					</tr>

	<%
				}
				
	%>
		
		</table>
<% 
		} 
	
	
	if(choice==2)
	{
		 query="select * from booktablee where name like '%"+ inputData+ "%' or email like '%"+ inputData+ "%' or phno like '%"+ inputData+ "%'  noofpeople like '%"+ inputData+ "%' tarikh like '%"+ inputData+ "%' vel like '%"+ inputData+ "%' or msg like '%" + inputData + "%'";
	
	rs = st.executeQuery(query);
%>
	<table border="" class="table table-striped">
		<tr>
			<th>Enquiry ID</th>
			<th>Customer Name</th>
			<th>Email ID</th>
			<th>Phone Number</th>
			<th>Number of People</th>
			<th>Date</th>
			<th>Time</th>
			<th>Messege</th>
		</tr>
<%
		while (rs.next()) 
		{
%>
		<tr>
			<td><%=rs.getInt(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
		</tr>

<%
		}
%>
	</table>
<%	
	}
	}
	catch (Exception e) 
	{ 
		out.println(e); 
		}
%>
<html>
<head>
			<style type="text/css">
			table,th,tr{
			boder:1px solid black;	
			border-collapse:collapse;
			font-size:19px; 
			text-align:center;
			}
			th,td{
			padding:20px;
			}
			</style>
			<title>SpiceUP Re</title>
			<!-- Latest compiled and minified CSS -->
			<link rel="stylesheet"
				href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
				integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
				crossorigin="anonymous">
			
			<!-- Optional theme -->
			<link rel="stylesheet"
				href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
				integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
				crossorigin="anonymous">
			
			<!-- Latest compiled and minified JavaScript -->
			<script
				src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
				integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
				crossorigin="anonymous"></script>
			<script>
</head>
</html>
