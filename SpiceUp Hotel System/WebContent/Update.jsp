<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>



<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<style>
#employee-info {
	width: 700px;
	height: 900px;
}

body [src $="3-ways-to-train-your-staff.jpg"] {
	filter: blur(3px);
	background-size: cover;
	width: 1340px;
	height: 1000px;
	opacity: 0.7;
}

form .inputs {
	background-color: #000;
	opacity: 0.8;
	margin-top: -900px;
	position: relative;
	height: 860px;
	margin-left: 400px;
	width: 600px;
	padding-top: 10px;
	padding-left: 10px;
	padding-right: 10px;
	color: white;
}

.input1 {
	display: block;
	padding-bottom: 15px;
}

.input2 {
	display: block;
	padding-bottom: 15px;
}

.input3 {
	display: block;
	padding-bottom: 15px;
}

.input4 {
	display: block;
	padding-bottom: 15px;
}

.input5 {
	display: block;
	padding-bottom: 15px;
}

.input6 {
	display: block;
	padding-bottom: 15px;
}

.input7 {
	display: block;
	padding-bottom: 15px;
}

.input1 input {
	height: 50px;
	width: 100%;
}

.input2 input {
	height: 50px;
	width: 100%;
}

.input3 input {
	height: 50px;
	width: 100%;
}

.input4 input {
	height: 50px;
	width: 100%;
}

.input5 input {
	height: 50px;
	width: 100%;
}

.input6 input {
	height: 50px;
	width: 100%;
}

.input7 input {
	height: 50px;
	width: 100%;
}

select {
	height: 50px;
	width: 100%;
}

label {
	font-size: 20px;
	font-family: cursive;
}

#add-button-logo {
	height: 35px;
	width: 35px;
}

button {
	display: block;
	margin-top: 20px;
	background-color: orange;
	height: 50px;
	text-align: center;
	width: 20%;
	margin-left: 1px;
	font-size: 33px;
	border: none;
	padding: 12px 16px;
	cursor: pointer;
	padding-top: 6px;
	border-radius: 4px;
	font-family: Calibri;
}

button:hover {
	background-color: RoyalBlue;
}

.container {
	height: 50px;
	width: 100%;
	text-align: center;
	margin-top: 0px;
	margin-left: 0px;
	margin-right: 0px;
	background-color: grey;
}

.container h3 {
	font-size: 30px;
	margin-top: 5px;
	font-style: bold;
	margin-right: -40px;
	font-family: perpetua titling mt;
}

#output_image {
	max-width: 200px;
	max-height: 150px;
	margin-right: -400px;
	margin-top: -80px;
}

#records {
	height: 600px;
	width: 400px;
}

.show-records #recordbtn { /* position:absolute; */
	margin-right: -1000px;
	margin-top: 30px;
	background-color: gray;
	height: 50px;
	width: 100%;
	text-align: center;
	margin-left: 520px;
	font-size: 35px;
	border: none;
	padding: 12px 16px;
	cursor: pointer;
	padding-top: 6px;
	border-radius: 4px;
	font-family: Calibri;
}

</style>
<script>
	function updateEmp() {
		choice = 2;
		idd = document.getElementById("idd").value;
		name = document.getElementById("name").value;
		address = document.getElementById("address").value;
		email = document.getElementById("email").value;
		phno = document.getElementById("phno").value;
		age = document.getElementById("age").value;
		adhar_no = document.getElementById("aadhar_no").value;
		designation = document.getElementById("designation").value;

		//alert(idd+" "+name+" "+address+" "+email+" "+phno+ " "+age+" "+adhar_no+" "+designation);

		ob = new XMLHttpRequest();

		if (window.XMLHttpRequest) {
			ob = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			ob = new ActiveXObject("Microsoft.XMLHTTP");
		}
		ob.onreadystatechange = function() {
			if (ob.readyState == 4 && ob.status == 200) {
				alert(ob.responseText);

			}
		}
		ob.open("POST", "deleteEmp.jsp?ch=" + choice + "&id=" + idd + "&name="
				+ name + "&address=" + address + "&email=" + email + "&phno="
				+ phno + "&age=" + age + "&id=" + idd + "&adhar_no=" + adhar_no
				+ "&designation=" + designation);
		ob.send();

	}
</script>
</head>
<body>
<%
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
	ResultSet rs = null;
	//con=null;
%>

<form id="employee-form">
<%
	Statement st = con.createStatement();
	String ide = request.getParameter("id");
	int num = Integer.parseInt(ide); 
	//System.out.println(num);
	String query = "select * from employee where id='" + num + "'";
	rs = st.executeQuery(query);

	while (rs.next()) {
%> <input type="hidden" name="id" id="idd" value='<%=rs.getInt("id")%>' />
<div class="container">
<h3>EMPLOYEE UPDATION</h3>
<img
	src="https://www.hiupgroup.com/wp-content/uploads/2019/07/3-ways-to-train-your-staff.jpg" />
<section id="employee-info">
<div class="inputs">
<div class="input1">
<label for="name">Name</label> 
<input type="text" id="name" maxlength="30" value='<%=rs.getString("name")%>' />
</div>


<div class="input2"><label for="Address">Address</label> 
<input type="text" id="address" maxlength="100" value='<%=rs.getString("address")%>' />
</div>


<div class="input3"><label for="email">Email-Id</label> 
<input type="email" id="email" value='<%=rs.getString("email")%>' />
</div>


<div class="input4"><label for="Phone No">Phone No</label> 
<input
	type="text" id="phno" value='<%=rs.getString("phno")%>' />
</div>

<div class="input5"><label for="name">Age</label> 
<input
	type="text" id="age" value='<%=rs.getString("age")%>' />
</div>


<div class="input6"><label for="aadhar no">Aadhar Card Number</label> 
<input type="text" id="aadhar_no" value='<%=rs.getString("adhar_no")%>' disabled />
</div>

<!--<div class="input7" id="wrapper"><label for="photo">Upload Your Photo</label> 
<input type="file" accept="image/*" onchange="preview_image(event)" id="photo"> <img
	id="output_image"></div>-->
	
	
<div class="input6"><label for="designation">Designation</label> 
<input type="text" id="designation" value='<%=rs.getString("designation")%>' disabled />
</div>

<%
	}
%>
<div class="add-employee-btn">
<button type="button" class="btn btn-danger" onclick="updateEmp()">Update</button>
<a href="Staff.html"><button type="button" class="btn btn-primary" >Back</button></a></div>



<%
	String a = request.getParameter("id");
	String b = request.getParameter("name");
	String c = request.getParameter("address");
	String d = request.getParameter("email");
	String e = request.getParameter("phno");
	String f = request.getParameter("age");
	String g = request.getParameter("designation");

	if (a != null && b != null && c != null && d != null && e != null
			&& f != null && g != null) {
		String query1 = "update employee set name=?, address=?, email=?,  phno=? , age=? , designation=? where id = '"
				+ a + "'";
		PreparedStatement ps = con.prepareStatement(query1);
		ps.setString(1, b);
		ps.setString(2, c);
		ps.setString(3, d);
		ps.setString(4, e);
		ps.setString(5, f);
		ps.setString(6, g);
		ps.executeUpdate();
		response.sendRedirect("Staff.html");

	}
%>

</body>
</html>