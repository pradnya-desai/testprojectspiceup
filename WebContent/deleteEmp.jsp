<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@include file="conn.jsp"%>
<%
	int ch = Integer.parseInt(request.getParameter("ch"));
	if (ch == 1) {
		int id = Integer.parseInt(request.getParameter("id"));

		Statement st = con.createStatement();
		st.executeUpdate("delete from employee where id=" + id);
		out.println("Reocrd Deleted");
	}

	if (ch == 2) {
		int idd = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String phno = request.getParameter("phno");
		String age = request.getParameter("age");
		String aadhar_no = request.getParameter("aadhar_no");
		String designation = request.getParameter("designation");
		//out.println(idd+" "+name+" "+address+" "+email+" "+phno+" "+age+" "+aadhar_no+" "+designation);
		if (name != null && address != null && email != null
				&& phno != null && age != null && designation != null) {
			String query1 = "update employee set name=?, address=?, email=?,  phno=? , age=? , designation=? where id ="
					+ idd;
			PreparedStatement ps = con.prepareStatement(query1);
			ps.setString(1, name);
			ps.setString(2, address);
			ps.setString(3, email);
			ps.setString(4, phno);
			ps.setString(5, age);
			ps.setString(6, designation);
			int res = ps.executeUpdate();
			if (res == 1) {
				out.println("Record Updated Please click on the Back button.");
			}
		}

		//response.sendRedirect("Staff.html");

	}
%>
