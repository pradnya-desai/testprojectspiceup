<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String phno=request.getParameter("phno");
	String noofpeople=request.getParameter("noofpeople");
	String date=request.getParameter("date");
	String time=request.getParameter("time");
	String msg=request.getParameter("msg");
	String cardnumber=request.getParameter("cardnumber");
	String cardmonth=request.getParameter("cardmonth");
	String cardcvv=request.getParameter("cardcvv");
	String cardowner=request.getParameter("cardowner");
	out.print(name+""+email+""+phno+""+noofpeople+""+date+""+time+""+msg+""+cardnumber+""+cardmonth+""+cardcvv+""+cardowner);
%>