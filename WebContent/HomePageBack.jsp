<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@include file="conn.jsp" %>

<%!
public static boolean valPass(String password)
{
	if (password.length()<9)
	{
	if(checkPass(password))
	{
		return true;
	}
	else
	{
		return false;
	}

	}
	else
	{
	System.out.println("Too small");
	return false;
	}
}
public static boolean checkPass(String password)
{
	boolean hasNum=false;
	boolean hasCap=false;
	boolean hasLow=false;
	char c;
	for(int i=0;i<password.length();i++)
	{
	c=password.charAt(i);
	if(Character.isDigit(c))
	{
	hasNum=true;
	}
	else if(Character.isUpperCase(c))
	{
	hasCap=true;
	}
	else if(Character.isLowerCase(c))
	{ 
	hasLow=true;
	}
	if(hasNum && hasCap && hasLow)
	{
	return true;
	}

	}
	return false;
}
%>


<%

		
		int ch=Integer.parseInt(request.getParameter("choice"));
		
		Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		
		PreparedStatement ps1=con.prepareStatement("insert into register  values(?,?,?,?)");
		if(ch==0)
		{
			
			String user=request.getParameter("username");
			String pass=request.getParameter("password");
			ResultSet rs=st.executeQuery("select * from login where username = '"+user+"' and password = '"+pass+"'");
			if(rs.next())
			{
				out.println("Login Successful");
				
				/* response.sendRedirect("Dashboard.html"); */
			}	
			else
				out.println("Login Denied");
		} 
		else 
		{
			int id;
			
			String user=request.getParameter("user");
			String pass=request.getParameter("pass");
			String email=request.getParameter("email");
			ResultSet rs=st.executeQuery("select * from register where rname = '"+user+"'");
			
			if(!rs.next())
			{
				if(valPass(pass))
				{
					ResultSet rs1=st.executeQuery("select * from register");
					if(rs1.last())
				    {
				    	 id=rs1.getInt(1);
				 	     id++;
				    }
				    else
				    {
				    	id=1;
				    }
					ps1.setInt(1,id);
					ps1.setString(2,user);
					ps1.setString(3,pass);
					ps1.setString(4,email);
					int f=ps1.executeUpdate();
					if(f==1)
						out.println("User Registered");
				}
				else
				{
					out.print("Invalid Password(Password must include 8 Letters,(1 UpperCase,1 LowerCase,1 Digit))");
				}
			}
			else
			{
				out.print("User Already Exists");
			}
		}
%>