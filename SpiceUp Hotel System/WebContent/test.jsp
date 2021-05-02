<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>

<%@include file="conn.jsp" %>
<html>
<head>
<script type="text/javascript">
	function getTaskId(taskId)
	{
	    var id = taskId;
	    alert(id);
	}
</script>
</head>
<body>
<%
 	
		try
		{

		    PreparedStatement ps = con.prepareStatement("select * from contactus");
		    ResultSet rs = ps.executeQuery() ;
		
		    int status;
		    String getId;
		
		
		        while (rs.next())
		        {
		          String taskId = String.valueOf(rs.getInt(1));
		  		%>      
		          <tr>
		          <td><%=taskId%></td>
		
		          <td><input type="button" id="btnApprove" onclick="getTaskId(<%=taskId%>);" value="Approve" />
		          </td>
		          </tr>
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