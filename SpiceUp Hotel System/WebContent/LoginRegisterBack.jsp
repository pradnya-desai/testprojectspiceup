<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@include file="conn.jsp" %>

<%!
public static boolean valPass(String password)
{
	if (password.length()>8)
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
	int choice = Integer.parseInt(request.getParameter("choice"));

	Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs=null,rs2=null;
	PreparedStatement ps1 = con.prepareStatement("insert into register  values(?,?,?,?)");  
	if (choice == 1)//Login
	{

		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		rs = st.executeQuery("select * from login where username = '"+ user + "' and password = '" + pass + "'");
		if (rs.next()) 
		{
			out.println("Login Successful");
		} 
		else
			out.println("Login Denied");
	}
	else if(choice==2)//Register
	{
		int id;
		String user=request.getParameter("user");
		String pass=request.getParameter("pass");
		String email=request.getParameter("email");
		rs=st.executeQuery("select * from register where rname = '"+user+"'");
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
				out.print("Invalid Password(Password must more than 8 Letters and include(1 UpperCase,1 LowerCase,1 Digit))");
			}
		}
		else
		{
			out.print("User Already Exists");
		}
	}
	else if(choice==3)//Add Admin
	{
		String Rid=request.getParameter("btnAccept");
		rs=st.executeQuery("select * from register where rid="+Rid);
		
		if(rs.next())
		{
			String name=rs.getString(2);
			String pass=rs.getString(3);
			if(rs!=null)
			{
				PreparedStatement ps2=con.prepareStatement("insert into login values(?,?)");
				ps2.setString(1,name);
				ps2.setString(2,pass);
				int result=ps2.executeUpdate();
				if(result==1)
				{
					out.println("Admin Created");
					st.executeUpdate("delete from register where rid="+Rid);
				}
			}
		}
	}
	else if(choice==4)
	{
		String Rid=request.getParameter("btnReject");
		int res=st.executeUpdate("delete from register where rid="+Rid);
		if(res==1)
			out.println("Record Deleted");
	}
%>