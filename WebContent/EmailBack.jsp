<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,javax.mail.*,javax.mail.internet.*,java.util.*"%>
<%@include file="conn.jsp"%>
<%
	int eid=Integer.parseInt(request.getParameter("eid"));
	try
	{
		/* Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from contactus where eid="+eid);
		if(rs.next())
		{ */
			
			String to="prathameshjoshi39.com";
			String from="pmca83440@gmail.com";
			Properties properties=new Properties();
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.port", 587);
			properties.put("mail.smtp.user","username");
			properties.put("mail.smtp.port", "25");
			properties.put("mail.debug", "true");
			properties.put("mail.smtp.EnableSSL.enable","true");
			properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
			properties.setProperty("mail.smtp.socketFactory.fallback", "false");   
			properties.setProperty("mail.smtp.port", "465");   
			properties.setProperty("mail.smtp.socketFactory.port", "465"); 
			/*props.put("mail.smtp.host", "smtp.gmail.com");*/ 
			 
			 
			/*props.put("mail.smtp.auth", "true"); */
			/*props.put("mail.smtp.starttls.enable","true"); */
			

			
			Session session1=Session.getDefaultInstance(properties,new javax.mail.Authenticator()
			{
				protected PasswordAuthentication getPasswordAuthentication()
				{
					return new PasswordAuthentication("pmca83440@gmail.com","Mca@2011052");
				}
			});
			
			
			MimeMessage message=new MimeMessage(session1);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject("This is test subject Line!");
			message.setText("This is test mail");
			Transport.send(message);
			System.out.println("Sent message successfully....");
		/* } */
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>