<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>

<%@include file="conn.jsp"%>

<%
				String inputData = request.getParameter("search");
				String name = request.getParameter("name");
				String phno = request.getParameter("phno");
				String email = request.getParameter("email");
				String msg = request.getParameter("msg");
				String eMail="";
				
				try{
					Statement st = con.createStatement();
					ResultSet rs = null;
					String query;
					if (inputData == null || inputData.isEmpty())  
					{
						PreparedStatement ps = con.prepareStatement("select * from contactus");
						rs = ps.executeQuery();
					
%>
			<table border="" class="table table-striped">
				<tr>
					<th>Enquiry ID</th>
					<th>Customer Name</th>
					<th>Email ID</th>
					<th>Phone Number</th>
					<th>Messege</th>
					<th>Action</th>
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
					<% eMail=rs.getString(3); %>
					<td><input type="button" class="btn btn-primary" id="btnEmail" onclick="sendmail('<%=eMail%>');" value="Respond"/></td>
				</tr>
				
<%
					}
				}
				else
				{  
					PreparedStatement ps = con.prepareStatement("select * from contactuss where name like '%"+ inputData + "%' or email like '%" + inputData+ "%' or phno like '%" + inputData+ "%' or msg like '%" + inputData + "%'");
					ps.setString(1,name);
					ps.setString(2,email);
					ps.setString(3,phno);
					ps.setString(4,msg);
					rs=ps.executeQuery();
					while(rs.next())
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
				}
			}catch(Exception e)
			{
				e.printStackTrace();
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
			function sendmail(btnEmail){
				    
				
				var r = confirm("Do you want to respond this enqiry?");
				  if (r == true) 
				  {
					//var name = $('#Name').val();
						var email = btnEmail;
						var subject = "SpiceUp Restro & Bar";
						var message = "Thank you for contacting us.We will get back to you shortly";

						// var body = $('#body').val();

						/* var Body='Name: '+name+'<br>Email: '+email+'<br>Subject: '+subject+'<br>Message: '+message; */
						//console.log(name, phone, email, message);

						Email.send({
					SecureToken:"17bc2dd5-34fe-4a46-aca7-9ec53763bb5a",
							To: email,
							From: "spiceuprestro&bar@gmail.com",
							Subject: subject,
							Body: message
						}).then(
							message =>{
								//console.log (message);
								if(message=='OK'){
								alert('Your mail has been send. Thank you for connecting.');
								}
								else{
									console.error (message);
									alert('There is error at sending message. ')
									
								}

							}

						);
				  } else 
				  {
				    alert("You Cancel Operation!");
				  }
				
			}
			</script>
			<script src="https://code.jquery.com/jquery-2.2.4.min.js"
				integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
				crossorigin="anonymous"></script>
			<script src="https://smtpjs.com/v3/smtp.js"></script>
			</head>
			</html>
			
