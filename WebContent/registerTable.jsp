<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@include file="conn.jsp" %>
<html>
<head>
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

<script type="text/javascript">
	function getAcceptId(btnAccept)
	{
		
		  choice=3;
		  
		  if (confirm("Are you sure you want to this user as admin?")) 
		  {
			  ob=new XMLHttpRequest();
			  if(window.XMLHttpRequest)
			  {  
				  ob=new XMLHttpRequest();  
			  }  
			  else if(window.ActiveXObject)
			  {  
				  ob=new ActiveXObject("Microsoft.XMLHTTP");   
			  } 
			  ob.onreadystatechange=function()
			  {
			              if(ob.readyState==4 && ob.status==200)
			              {
			               		alert(ob.responseText);
			   			  }
			  }
			  ob.open("GET","LoginRegisterBack.jsp?btnAccept="+btnAccept+"&choice="+choice);
			  ob.send();
		  }
		  else 
		  {
		      console.log("You pressed Cancel!");
		  }
		  
		
	}
	function getRejectId(btnReject)
	{
		  choice=4;
		  if (confirm("Are you sure you want to delete the record?")) 
		  {
			  ob=new XMLHttpRequest();
			  if(window.XMLHttpRequest)
			  {  
				  ob=new XMLHttpRequest();  
			  }  
			  else if(window.ActiveXObject)
			  {  
				  ob=new ActiveXObject("Microsoft.XMLHTTP");   
			  } 
			  ob.onreadystatechange=function()
			  {
			              if(ob.readyState==4 && ob.status==200)
			              {
			               		alert(ob.responseText);
			   			  }
			  }
			  ob.open("GET","LoginRegisterBack.jsp?btnReject="+btnReject+"&choice="+choice);
			  ob.send(); 	  
		  }
		  else 
		  {
		      console.log("You pressed Cancel!");
		  }
		  
	}
</script>
</head>
<body>
<%
	try	
	{
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from register");
		%>
		<table border="" class="table table-striped">
		<tr><th>Name</th><th>Password</th><th>Email ID</th></tr>
		<%
		while(rs.next())
		{
			int Acceptid=rs.getInt(1);
			%>
			<tr><td><%=rs.getInt(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><input type="button" class="btn btn-success" id="btnAccept" onclick="getAcceptId(<%=Acceptid%>);" value="Accept"/></td><td><input type="button" class="btn btn-danger" id="btnReject" onclick="getRejectId(<%=Acceptid%>);" value="Reject"/></td></tr>
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