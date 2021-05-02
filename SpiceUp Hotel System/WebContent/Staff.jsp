<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,java.io.*"%>
<%@include file="conn.jsp"%>

<%
	int id;
	//int choice = Integer.parseInt(request.getParameter("choice"));
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String email = request.getParameter("email");
	String phno = request.getParameter("phno");
	int age = Integer.parseInt(request.getParameter("age"));
	String aadhar_no = request.getParameter("aadhar_no");
	//String output_image=request.getParameter("output_image");
	String desg = request.getParameter("desg");

	/* out.println(name+" "+address+" "+email+" "+phno+" "+age+" "+address+" "+aadhar_no+" "+output_image+" "+desg); */
	Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
			ResultSet.CONCUR_UPDATABLE);
	ResultSet rs = st.executeQuery("select * from employee");
	if (rs.last()) {
		id = rs.getInt(1);
		id++;
	} else {
		id = 1;
	}

	PreparedStatement ps1 = con
			.prepareStatement("insert into employee values(?,?,?,?,?,?,?,?)");
	
	
			ps1.setInt(1, id);
			ps1.setString(2, name);
			ps1.setString(3, address);
			ps1.setString(4, email);
			ps1.setString(5, phno);
			ps1.setInt(6, age);
			ps1.setString(7, aadhar_no);
			//ps1.setString(8,output_image);
			ps1.setString(8, desg);
			int n = ps1.executeUpdate();
			if(n==1)
			{
				out.println("Employee Saved");
			}
			else
				out.println("Error Occured");  	 
		
%>
